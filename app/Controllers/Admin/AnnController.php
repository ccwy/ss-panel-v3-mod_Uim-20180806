<?php

namespace App\Controllers\Admin;

use App\Models\Ann;
use App\Controllers\AdminController;
use App\Utils\Telegram;
use App\Services\Config;
use App\Services\Mail;
use App\Models\User;
use Ozdemir\Datatables\Datatables;
use App\Utils\DatatablesHelper;

//邮件记录
use App\Models\Emailjilu;
use voku\helper\AntiXSS;

class AnnController extends AdminController
{
    public function index($request, $response, $args)
    {
        $table_config['total_column'] = array("op" => "操作", "id" => "ID",
                              "date" => "日期", "content" => "内容");
        $table_config['default_show_column'] = array("op", "id",
                                                    "date", "content");
        $table_config['ajax_url'] = 'announcement/ajax';
        return $this->view()->assign('table_config', $table_config)->display('admin/announcement/index.tpl');
    }

    public function create($request, $response, $args)
    {
        return $this->view()->display('admin/announcement/create.tpl');
    }

    public function add($request, $response, $args)
    {
        $ann = new Ann();
        $ann->date =  date("Y-m-d H:i:s");
        $ann->content =  $request->getParam('content');
        $ann->markdown =  $request->getParam('markdown');
        $issend = $request->getParam('issend');
        $vip = $request->getParam('vip');
		$idd = $request->getParam('idd');
        $users = User::all();
        if (!$ann->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = "添加失败";
            return $response->getBody()->write(json_encode($rs));
        }
       
		//注销自动发邮件
        if ($issend == 1){
            foreach($users as $user){
                if ($user->id >= $vip && $user->id <= $idd){
                    $subject = Config::get('appName')." - 公告";
                    $to = $user->email;
                    $text = $ann->content;
                    try {
                        Mail::send($to, $subject, 'news/gonggao.tpl', [
                            "user" => $user,"text" => $text
                        ], [
                        ]);
                    } catch (Exception $e) {
                        echo $e;
                    }
						
		$antiXss = new AntiXSS();
		$emailjilu = new Emailjilu();
		$emailjilu->userid = $user->id;
		$emailjilu->username = $user->user_name;
		$emailjilu->useremail = $user->email;
		$emailjilu->biaoti = $antiXss->xss_clean($subject);
		$emailjilu->neirong = $antiXss->xss_clean($text);
		$emailjilu->datetime = time();
		$emailjilu->save();
		
                }
            }
        } 

        Telegram::SendMarkdown("新公告：".PHP_EOL.$request->getParam('markdown'));
        $rs['ret'] = 1;
        $rs['msg'] = "公告添加成功";
        return $response->getBody()->write(json_encode($rs));
    }

    public function edit($request, $response, $args)
    {
        $id = $args['id'];
        $ann = Ann::find($id);
        if ($ann == null) {
        }
        return $this->view()->assign('ann', $ann)->display('admin/announcement/edit.tpl');
    }

    public function update($request, $response, $args)
    {
        $id = $args['id'];
        $ann = Ann::find($id);

        $ann->content =  $request->getParam('content');
        $ann->markdown =  $request->getParam('markdown');
        $ann->date =  date("Y-m-d H:i:s");
		$issend = $request->getParam('issend');
        $vip = $request->getParam('vip');
		$idd = $request->getParam('idd');
        $users = User::all();


        if (!$ann->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = "修改失败";
            return $response->getBody()->write(json_encode($rs));
        }

		//注销自动发邮件
        if ($issend == 1){
            foreach($users as $user){
                if ($user->id >= $vip && $user->id <= $idd){
                    $subject = Config::get('appName')." - 公告";
                    $to = $user->email;
                    $text = $ann->content;
                    try {
                        Mail::send($to, $subject, 'news/gonggao.tpl', [
                            "user" => $user,"text" => $text
                        ], [
                        ]);
                    } catch (Exception $e) {
                        echo $e;
                    }
						
		$antiXss = new AntiXSS();
		$emailjilu = new Emailjilu();
		$emailjilu->userid = $user->id;
		$emailjilu->username = $user->user_name;
		$emailjilu->useremail = $user->email;
		$emailjilu->biaoti = $antiXss->xss_clean($subject);
		$emailjilu->neirong = $antiXss->xss_clean($text);
		$emailjilu->datetime = time();
		$emailjilu->save();
		
                }
            }
        } 
        Telegram::SendMarkdown("公告更新：".PHP_EOL.$request->getParam('markdown'));

        $rs['ret'] = 1;
        $rs['msg'] = "修改成功";
        return $response->getBody()->write(json_encode($rs));
    }


    public function delete($request, $response, $args)
    {
        $id = $request->getParam('id');
        $ann = Ann::find($id);
        if (!$ann->delete()) {
            $rs['ret'] = 0;
            $rs['msg'] = "删除失败";
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = "删除成功";
        return $response->getBody()->write(json_encode($rs));
    }

    public function ajax($request, $response, $args)
    {
        $datatables = new Datatables(new DatatablesHelper());
        $datatables->query('Select id as op,id,date,content from announcement');

        $datatables->edit('op', function ($data) {
            return '<a class="btn btn-brand" href="/admin/announcement/'.$data['id'].'/edit">编辑</a>
                    <a class="btn btn-brand-accent" id="delete" value="'.$data['id'].'" href="javascript:void(0);" onClick="delete_modal_show(\''.$data['id'].'\')">删除</a>';
        });

        $datatables->edit('DT_RowId', function ($data) {
            return 'row_1_'.$data['id'];
        });

        $body = $response->getBody();
        $body->write($datatables->generate());
    }
}

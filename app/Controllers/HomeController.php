<?php

namespace App\Controllers;

use App\Models\InviteCode;
use App\Models\User;
use App\Models\Code;
use App\Models\Payback;
use App\Models\Paylist;
use App\Services\Auth;
use App\Services\Config;
use App\Utils\Tools;
use App\Utils\Telegram;
use App\Utils\Tuling;
use App\Utils\TelegramSessionManager;
use App\Utils\QRcode;
use App\Utils\Pay;
use App\Utils\TelegramProcess;
use App\Utils\Spay_tool;

//shop
use App\Models\Shop;

/**
 *  HomeController
 */
class HomeController extends BaseController
{
    public function index()
    {
        return $this->view()->display('index.tpl');
    }
/*
    public function code()
    {
        $codes = InviteCode::where('user_id', '=', '0')->take(10)->get();
        return $this->view()->assign('codes', $codes)->display('code.tpl');
    }
*/
    public function down()
    {
    }

    public function toos()
    {
        return $this->view()->display('toos.tpl');
    }
    
    public function fstaffs()
    {
        return $this->view()->display('fstaffs.tpl');
    }
	
	
    public function cous()
    {
        return $this->view()->display('cous.tpl');
    }
	
	public function code_error()
    {
        return $this->view()->display('code_error.tpl');
    }
    
    
    public function telegram($request, $response, $args)
    {
        $token = "";
        if (isset($request->getQueryParams()["token"])) {
            $token = $request->getQueryParams()["token"];
        }
        
        if ($token == Config::get('telegram_request_token')) {
            TelegramProcess::process();
        } else {
            echo("不正确请求！");
        }
    }
    
    public function page404($request, $response, $args)
    {
        return $this->view()->display('404.tpl');
    }
    
    public function page405($request, $response, $args)
    {
        return $this->view()->display('405.tpl');
    }
    
    public function page500($request, $response, $args)
    {
		return $this->view()->display('500.tpl');
    }
    
    public function codepay_callback($request, $response, $args)
    {
        echo '
            <script>
               window.location.href="/user/code";
            </script>
            ';
        return;
    }
  
    public function pay_callback($request, $response, $args)
    {
        Pay::callback($request);
    }
  
    public function f2fpay_pay_callback($request, $response, $args)
    {
        Pay::f2fpay_pay_callback($request);
    }
  
    public function codepay_pay_callback($request, $response, $args)
    {
        Pay::codepay_pay_callback($request);
    }
	
    public function shop($request, $response, $args)
    {
        $pageNum = 1;
        if (isset($request->getQueryParams()["page"])) {
            $pageNum = $request->getQueryParams()["page"];
        }
		//商品显示模式优化
       // $shops = Shop::where("status", 1)->orderBy("name")->paginate(20, ['*'], 'page', $pageNum);
	   $shops = Shop::where("status", 1)->paginate(15, ['*'], 'page', $pageNum);
        $shops->setPath('shop');

        return $this->view()->assign('shops', $shops)->display('shop.tpl');
    }
}

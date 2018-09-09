<?php

namespace App\Controllers;

use App\Models\User;
use App\Models\PasswordReset;
use App\Services\Password;
use App\Utils\Hash;

/***
 * Class Password
 * @package App\Controllers
 * 密码重置
 */

class PasswordController extends BaseController
{
    public function reset()
    {
        return $this->view()->display('password/reset.tpl');
    }

    public function handleReset($request, $response, $args)
    {
        $email =  $request->getParam('email');
        // check limit

        // send email
        $user = User::where('email', $email)->first();
        if ($user == null) {
            $res['ret'] = 0;
            $res['msg'] = '此邮箱不存在.';
            return $response->getBody()->write(json_encode($res));
        }
        Password::sendResetEmail($email);
        $res['ret'] = 1;
        $res['msg'] = '重置邮件已经发送,请检查邮箱.';
        return $response->getBody()->write(json_encode($res));
    }

    public function token($request, $response, $args)
    {
        $token = $args['token'];
        return $this->view()->assign('token', $token)->display('password/token.tpl');
    }

    public function handleToken($request, $response, $args)
    {
        $tokenStr = $args['token'];
        $password =  $request->getParam('password');
        $repasswd =  $request->getParam('repasswd');
        
        if ($password != $repasswd) {
            $res['ret'] = 0;
            $res['msg'] = "两次输入不符合";
            return $response->getBody()->write(json_encode($res));
        }

        if (strlen($password) < 8) {
            $res['ret'] = 0;
            $res['msg'] = "密码太短啦";
            return $response->getBody()->write(json_encode($res));
        }
        
        // check token
        $token = PasswordReset::where('token', $tokenStr)->first();
        if ($token == null || $token->expire_time < time()) {
            $res['ret'] = 0;
            $res['msg'] = '链接已经失效,请重新获取';
            return $response->getBody()->write(json_encode($res));
        }

        $user = User::where('email', $token->email)->first();
        if ($user == null) {
            $res['ret'] = 0;
            $res['msg'] = '链接已经失效,请重新获取';
            return $response->getBody()->write(json_encode($res));
        }

        // reset password
        $hashPassword = Hash::passwordHash($password);
        $user->pass = $hashPassword;
        $user->ga_enable = 0;
        if (!$user->save()) {
            $res['ret'] = 0;
            $res['msg'] = '重置失败,请重试';
            return $response->getBody()->write(json_encode($res));
        }
        $res['ret'] = 1;
        $res['msg'] = '重置成功';
        
       // $user->clean_link();
	   //修复更改密码订阅链接变化问题
        
        return $response->getBody()->write(json_encode($res));
    }
}

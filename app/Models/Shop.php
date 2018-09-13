<?php

namespace App\Models;

use App\Services\Config;

class Shop extends Model
{
    protected $connection = "default";
    protected $table = "shop";

    public function content()
    {
        $content = json_decode($this->attributes['content'], true);
        $content_text="";
        $i = 0;
        foreach ($content as $key=>$value) {
            switch ($key) {
                case "bandwidth":
                    $content_text .= "添加流量 ".$value." G ";
                    break;
                case "expire":
                    $content_text .= ", 为账号的有效期添加 ".$value." 天 ";
                    break;
                case "class":
                    $content_text .= ", 为账号升级为等级 ".$value." , 有效期 ".$content["class_expire"]." 天 ";
                    break;
                case "reset":
                    $content_text .= ", 在 ".$content["reset_exp"]." 天内 ，每 ".$value." 天重置流量为 ".$content["reset_value"]." G ";
                    break;
                case "speedlimit":
                    if ($value == 0){
                        $content_text .= ", 用户端口不限速 " ;
                    }else{
                        $content_text .= ", 用户端口限速变为".$value." Mbps ";
                    }
                    break;
                case "connector":
                    if ($value == 0){
                        $content_text .= ", 用户IP不限制";
                    }else{
                        $content_text .= ", 用户IP限制变为 ".$value." 个";
                    }
                    break;
                default:
            }

            //if ($i<count($content)&&$key!="connector") {
                //$content_text .= ",";
            //}

            $i++;
        }

        if (substr($content_text, -1, 1)==",") {
            $content_text=substr($content_text, 0, -1);
        }

        return $content_text;
    }

    public function bandwidth()
    {
        $content =  json_decode($this->attributes['content']);
        if (isset($content->bandwidth)) {
            return $content->bandwidth;
        } else {
            return 0;
        }
    }

    public function expire()
    {
        $content =  json_decode($this->attributes['content']);
        if (isset($content->expire)) {
            return $content->expire;
        } else {
            return 0;
        }
    }

    public function reset()
    {
        $content =  json_decode($this->attributes['content']);
        if (isset($content->reset)) {
            return $content->reset;
        } else {
            return 0;
        }
    }

    public function reset_value()
    {
        $content =  json_decode($this->attributes['content']);
        if (isset($content->reset_value)) {
            return $content->reset_value;
        } else {
            return 0;
        }
    }

    public function reset_exp()
    {
        $content =  json_decode($this->attributes['content']);
        if (isset($content->reset_exp)) {
            return $content->reset_exp;
        } else {
            return 0;
        }
    }

    public function user_class()
    {
        $content =  json_decode($this->attributes['content']);
        if (isset($content->class)) {
            return $content->class;
        } else {
            return 0;
        }
    }

    public function class_expire()
    {
        $content =  json_decode($this->attributes['content']);
        if (isset($content->class_expire)) {
            return $content->class_expire;
        } else {
            return 0;
        }
    }

    public function speedlimit()
    {
        $content =  json_decode($this->attributes['content']);
        if (isset($content->speedlimit)) {
            return $content->speedlimit;
        } else {
            return 0;
        }
    }

    public function connector()
    {
        $content =  json_decode($this->attributes['content']);
        if (isset($content->connector)) {
            return $content->connector;
        } else {
            return 0;
        }
    }

    public function buy($user, $is_renew = 0)
    {
        $content = json_decode($this->attributes['content'], true);
        $content_text="";

        foreach ($content as $key=>$value) {
            switch ($key) {
                case "bandwidth":
                    if ($is_renew == 0) {
                        if (Config::get('enable_bought_reset') == 'false') { //是否允许叠加等级到期时间和流量
							if ($this->attributes['auto_reset_day'] == 1) { //自动重置流量
                             $user->auto_reset_day=date("d");
							 $user->auto_reset_bandwidth = $value;
							}
                            $user->transfer_enable=$value*1024*1024*1024;
                            $user->u = 0;
                            $user->d = 0;
                            $user->last_day_t = 0;
							$user->tixing =0;
                        } else {
							 if ($this->attributes['auto_reset_day'] == 1) {  //自动重置流量
                             $user->auto_reset_day=date("d");
							 $user->auto_reset_bandwidth = $value;
							 }
							if (Config::get('enable_bought_class') == 'true' || $user->class == $value) { //是否允许跨等级叠加
                            $user->transfer_enable=$user->transfer_enable+$value*1024*1024*1024;
							} else {
							$user->transfer_enable=$value*1024*1024*1024;
                            $user->u = 0;
                            $user->d = 0;
                            $user->last_day_t = 0;
							}
							$user->tixing =0;
							
                        }
                    } else {
                        if ($this->attributes['auto_reset_bandwidth'] == 1) {
							if ($this->attributes['auto_reset_day'] == 1) {  //自动重置流量
                             $user->auto_reset_day=date("d");
							 $user->auto_reset_bandwidth = $value;
							}
                            $user->transfer_enable=$value*1024*1024*1024;
                            $user->u = 0;
                            $user->d = 0;
                            $user->last_day_t = 0;
							$user->tixing =0;
							
                        } else {
							if ($this->attributes['auto_reset_day'] == 1) {  //自动重置流量
                             $user->auto_reset_day=date("d");
							 $user->auto_reset_bandwidth = $value;
							}
							
                            if (Config::get('enable_bought_class') == 'true' || $user->class == $value) { //是否允许跨等级叠加
                            $user->transfer_enable=$user->transfer_enable+$value*1024*1024*1024;
							} else {
							$user->transfer_enable=$value*1024*1024*1024;
                            $user->u = 0;
                            $user->d = 0;
                            $user->last_day_t = 0;
							}
							$user->tixing =0;
							
                        }
                    }
                    break;
                case "expire":
				 if (Config::get('enable_bought_reset') == 'false') { //是否允许叠加等级到期时间和流量
					   $user->expire_in=date("Y-m-d H:i:s", time()+7200+$value*86400);
				 } else {					   
                    if (time()>strtotime($user->expire_in) || $user->class==0 ) {
                        $user->expire_in=date("Y-m-d H:i:s", time()+7200+$value*86400);
                    } else {						
						if (Config::get('enable_bought_class') == 'true' || $user->class == $value) { //是否允许跨等级叠加
                        $user->expire_in=date("Y-m-d H:i:s", strtotime($user->expire_in) + $value*86400);
                    } else {
						 $user->expire_in=date("Y-m-d H:i:s", time()+7200+$value*86400);
					       }
					}
				 }
					
                    break;
                case "class":
				if (Config::get('enable_bought_reset') == 'false') { //是否允许叠加等级到期时间和流量
					$user->class_expire=date("Y-m-d H:i:s", time()+$content["class_expire"]*86400);					
				} else {
					if (time()>strtotime($user->class_expire) || $user->class==0 ) {					
						$user->class_expire=date("Y-m-d H:i:s", time()+$content["class_expire"]*86400);						
					} else {	
					
					if (Config::get('enable_bought_class') == 'true' || $user->class == $value) { //是否允许跨等级叠加
					 $user->class_expire=date("Y-m-d H:i:s", strtotime($user->class_expire)+$content["class_expire"]*86400);				    
					} else {
							$user->class_expire=date("Y-m-d H:i:s", time()+$content["class_expire"]*86400);
						   }						   					
					}
				}
                    $user->class=$value;
                    
                    break;
                case "speedlimit":
                    $user->node_speedlimit=$value;
                    break;
                case "connector":
                    $user->node_connector=$value;
                    break;
                default:
            }
        }

        $user->save();
    }
}

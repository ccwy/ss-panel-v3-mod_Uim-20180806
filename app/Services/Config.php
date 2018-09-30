<?php

namespace App\Services;

class Config
{
    public static function get($key)
    {
        global $System_Config;
        return $System_Config[$key];
    }

    public static function set($key, $value)
    {
        global $System_Config;
        $System_Config[$key] = $value;
    }

    public static function getPublicConfig()
    {
        return [
            "appName" => self::get("appName"),
            "version" => VERSION,
            "baseUrl" => self::get("baseUrl"),
			"min_port" => self::get("min_port"),
			"max_port" => self::get("max_port"),
            "checkinMin" => self::get("checkinMin"),
            "checkinMax" => self::get("checkinMax"),
			"invite_price"=>self::get("invite_price"),
			"invite_get_money"=>self::get("invite_get_money"),
            "code_payback" => self::get("code_payback"),
			"invite_gift"=>self::get("invite_gift"),
            "wecenter_url" => self::get("wecenter_url"),
			"port_price" => self::get("port_price"),
			"port_price_specify" => self::get("port_price_specify"),
            "enable_wecenter" => self::get("enable_wecenter"),
            "jump_delay" => self::get("jump_delay"),
            "enable_analytics_code" => self::get("enable_analytics_code"),
            "enable_donate" => self::get("enable_donate"),
            "enable_telegram" => self::get("enable_telegram"),
            "payment_system" => self::get("payment_system"),
          	"enable_crisp" => self::get("enable_crisp"),
          	"crisp_id" => self::get("crisp_id"),
          	"enable_ticket"=> self::get("enable_ticket"),
			"enable_admin_contact" => self::get("enable_admin_contact"),
			"admin_contact1" => self::get("admin_contact1"),
			"admin_contact2" => self::get("admin_contact2"),
			"admin_contact3" => self::get("admin_contact3"),
			"enable_flag" => self::get("enable_flag"),
			
		    "enable_account_expire_delete_days" => self::get("enable_account_expire_delete_days"),     //账号过期时间
			"enable_auto_clean_unused_days" => self::get("enable_auto_clean_unused_days"),  //账号过期时间
			"rssresd" => self::get("rssresd"),  //rss订阅地址
			//"payurl" => self::get("payurl"),  //spay支付地址
			//"payurl2" => self::get("payurl2"),  //码支付支付地址
			"roudeurl" => self::get("roudeurl"),  //ssr路由器订阅地址
			"payurlma" => self::get("payurlma"),  // 充值码购买地址
			"anyconnect" => self::get("anyconnect"),  // anyconnect vpn地址
			"telegram1" => self::get("telegram1"),  // telegram1 通知频道地址
			"telegram2" => self::get("telegram2"),  // telegram2 用户群地址
			"telegram3" => self::get("telegram3"),  // telegram2 联系页面地址
			"connemail" => self::get("connemail"),  // 联系邮件
			"iosinfo" => self::get("iosinfo"),  // ios小火煎下载账号
			"iospasswd" => self::get("iospasswd"),  // ios小火煎下载密码
			"jiaocheng1" => self::get("jiaocheng1"),  // 教程地址
			"regiestrs" => self::get("regiestrs"),  // 注册开关
			"restport" => self::get("restport"),  // 重置端口
		    "metodaes" => self::get("metodaes"),  // v2ray加密算法
			"vmesstcp" => self::get("vmesstcp"),  // v2ray传输协议
			"murss22" => self::get("murss22"),  // 单端口开关
			"codypaymenay" => self::get("codypaymenay")  //  //码支付最低限额
		
			
         ];
    }

    public static function getDbConfig()
    {
        return [
            'driver'    => self::get('db_driver'),
            'host'      => self::get('db_host'),
            'database'  => self::get('db_database'),
            'username'  => self::get('db_username'),
            'password'  => self::get('db_password'),
            'charset'   => self::get('db_charset'),
            'collation' => self::get('db_collation'),
            'prefix'    => self::get('db_prefix')
        ];
    }

    public static function getRadiusDbConfig()
    {
        return [
            'driver'    => self::get('db_driver'),
            'host'      => self::get('radius_db_host'),
            'database'  => self::get('radius_db_database'),
            'username'  => self::get('radius_db_user'),
            'password'  => self::get('radius_db_password'),
            'charset'   => self::get('db_charset'),
            'collation' => self::get('db_collation')
        ];
    }

    public static function getWecenterDbConfig()
    {
        return [
            'driver'  => self::get('db_driver'),
            'host'  => self::get('wecenter_db_host'),
            'database'  => self::get('wecenter_db_database'),
            'username'  => self::get('wecenter_db_user'),
            'password'  => self::get('wecenter_db_password'),
            'charset'   => self::get('db_charset'),
            'collation' => self::get('db_collation')
        ];
    }

    public static function getSupportParam($type)
    {
        switch ($type) {
            case 'obfs':
                $list = array(/*'plain', 'http_simple', 'http_simple_compatible', 'http_post', 'http_post_compatible',
                            'tls1.2_ticket_auth', 'tls1.2_ticket_auth_compatible', 'tls1.2_ticket_fastauth', 'tls1.2_ticket_fastauth_compatible',
                            'simple_obfs_http', 'simple_obfs_http_compatible', 'simple_obfs_tls', 'simple_obfs_tls_compatible'*/'tls1.2_ticket_auth', 'tls1.2_ticket_fastauth' );
                return $list;
            case 'protocol':
                $list = array(//'origin', 'verify_deflate',
                           // 'auth_sha1_v4', 'auth_sha1_v4_compatible',
							'auth_aes128_sha1', 'auth_aes128_md5', 'auth_chain_a', 'auth_chain_b');
                return $list;
            case 'allow_none_protocol':
                $list = array('auth_chain_a', 'auth_chain_b');
                return $list;
            case 'relay_able_protocol':
                $list = array('auth_aes128_md5', 'auth_aes128_sha1', 'auth_chain_a', 'auth_chain_b');
                return $list;
            case 'ss_aead_method':
                $list = array('aes-128-gcm', 'aes-192-gcm',
                'aes-256-gcm', 'chacha20-ietf-poly1305', 'xchacha20-ietf-poly1305');
                return $list;
            case 'ss_obfs':
                $list = array('simple_obfs_http', 'simple_obfs_http_compatible', 'simple_obfs_tls', 'simple_obfs_tls_compatible');
                return $list;
            default:
                $list = array(//'rc4-md5', 'rc4-md5-6', 'aes-128-cfb', 'aes-192-cfb', 'aes-256-cfb',
                            //'aes-128-ctr', 'aes-192-ctr', 'aes-256-ctr', 'camellia-128-cfb', 'camellia-192-cfb', 'camellia-256-cfb',
                           // 'bf-cfb', 'cast5-cfb', 'des-cfb', 'des-ede3-cfb', 'idea-cfb',
                           // 'rc2-cfb', 'seed-cfb', 'salsa20', 'chacha20', 'chacha20-ietf', 'none', 'aes-128-gcm', 'aes-192-gcm',
                           // 'aes-256-gcm', 'chacha20-ietf-poly1305', 'xchacha20-ietf-poly1305'
						  'chacha20', 'chacha20-ietf' );
                return $list;
        }
    }
}

#! /bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
#===============================================================================================
#   System Required:  Centos/Debian/Ubuntu
#   Description:  Install Proxy for Google by Nginx
#   Author: Arno <blogfeng@blogfeng.com>
#   Intro:  https://github.com/arnofeng/ngx_google_deployment
#===============================================================================================
clear
echo "
#This shell is for Nginx_proxy_google
#This project is on url:https://github.com/arnofeng/ngx_google_deployment
#Current release is Nginx-1.8.0
#Thank you for any feedback to me:blogfeng@blogfeng.com
"
# Make sure only root can run our script
function rootness {
if [[ $EUID -ne 0 ]]; then
   echo "Error:This script must be run as root!" 1>&2
   exit 1
fi
}

# Uninstall ngx_google_deployment
function uninstall {
    echo "Are you sure uninstall ngx_google_deployment? (y/n) "
    echo ""
    read -p "(Default: n):" answer
    if [ -z $answer ]; then
        answer="n"
    fi
    if [ "$answer" = "y" ]; then
        /etc/nginx/sbin/nginx -s stop
        if [ $? -eq 0 ]; then
                    echo "ngx_google_deployment process has been killed"
        fi
        # restore /etc/rc.local
        if [[ -s /etc/rc.local_bak ]]; then
            rm -f /etc/rc.local
            cp /etc/rc.local_bak /etc/rc.local
        fi
        # delete config file
        rm -rf /etc/nginx
        # delete nginx
        rm -rf /var/log/nginx
        rm -rf /var/lib/nginx
        rm -rf /usr/src/ngx_http_substitutions_filter_module
        rm -rf /var/www/google
        rm -rf /usr/src/nginx*
        
        echo "Ngx_google_deployment uninstall success!"
    else
        echo "Uninstall cancelled, Nothing to do"
    fi
}

# Install ngx_google_deployment
function Install {
    echo -n "Select which you want:
	1.Install for Debian/Ubuntu
	2.Install for Centos
	3.Uninstall ngx_google_deployment

	:"  
	read key
	if [ $key = "1" ];then
		wget -N --no-check-certificate https://raw.githubusercontent.com/arnofeng/ngx_google_deployment/master/Debian/nginx_proxy.sh
		chmod 771 ./nginx_proxy.sh
		bash ./nginx_proxy.sh
	elif [ $key = "2" ]; then
		wget -N --no-check-certificate https://raw.githubusercontent.com/arnofeng/ngx_google_deployment/master/Centos/nginx_proxy.sh
		chmod 771 ./nginx_proxy.sh
		bash ./nginx_proxy.sh
	elif [ $key = "3" ]; then
		uninstall
	else
		echo '#Wrong option,exit!'
		exit 1
	fi
}

rootness
Install

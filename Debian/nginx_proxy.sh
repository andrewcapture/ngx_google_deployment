#! /bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
#===============================================================================================
#   System Required:  Debian or Ubuntu (32bit/64bit)
#   Description:  Install Proxy for Google by Nginx
#   Author: Arno <blogfeng@blogfeng.com>
#   Intro:  https://github.com/arnofeng/ngx_google_deployment
#===============================================================================================
clear
echo "
#This shell is for Nginx_proxy_google on Debian
#This project is on url:arnofeng.github.io
#thank you for any feedback to me"
echo -n "To be sure your system is Debian,please enter 'yes' to continue: "  
read key
if [ $key = "yes" ];then
	echo -n "Set your domain for google search: " 
    read key1
    DOMAIN1=$key1
    echo -n "Set your domain for google scholar: "
    read key2
    DOMAIN2=$key2
    if [ $DOMAIN1 = $DOMAIN2 ];then
    	echo "Two domain should not be the same! Error happens!"
    	exit 1
    else
    	echo "your google search domain is $DOMAIN2"
    	echo "your google scholar domain is $DOMAIN1"
    	echo -n "Enter any key to continue ... "
        read goodmood
    	echo 'Start installing!' 	
    fi
    
else
	exit 1
fi
#1.update  system
apt-get update
#2.install  dependence
apt-get install -y libpcre3 libpcre3-dev 
apt-get install -y openssl libssl-dev
apt-get install -y git gcc g++ make automake
cd /usr/src
#3.download  nginx-1.8.0
wget http://nginx.org/download/nginx-1.8.0.tar.gz
tar -zxvf nginx-1.8.0.tar.gz
#4.git clone  ngx_http_substitutions_filter_module
git clone git://github.com/arnofeng/ngx_http_substitutions_filter_module.git
#5.configure for nginx
cd /usr/src/nginx-1.8.0
mkdir -p /var/lib/nginx/body
./configure --prefix=/etc/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-log-path=/var/log/nginx/access.log --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --lock-path=/var/lock/nginx.lock --pid-path=/var/run/nginx.pid --with-pcre-jit --with-debug --with-http_addition_module --with-http_dav_module  --with-http_gzip_static_module  --with-http_realip_module --with-http_stub_status_module --with-http_ssl_module --with-http_sub_module --with-ipv6 --with-sha1=/usr/include/openssl --with-md5=/usr/include/openssl --with-mail --with-mail_ssl_module --with-http_sub_module --add-module=/usr/src/ngx_http_substitutions_filter_module
#6.make && make install for nginx
make && make install


#7.start nginx
/etc/nginx/sbin/nginx
#8.mkdir /var/www/
mkdir -p /var/www
#9.set auto-start for nginx
sed -i 's/exit/\/etc\/nginx\/sbin\/nginx \nexit /' /etc/rc.local
# ngx_google_deployment
* Install Proxy for Google by Nginx.
* This project origins from g.adminhost.org(can only be accessed by typing the domain).

```javascript
1.Forbid popular spiders like Google、Baidu;
2.Forbid any illegal referer;
3.Limit frequency of the same IP at 10 times in 1 second;
4.Can only access this site by typing the domian or using bookmarks;
5.If pages show "403 Forbid",try to delete "cookies" in your browser;
And more is to be discovered.
```

# [中文说明](http://arnofeng.github.io/%E6%96%87%E7%AB%A0/2016-01/NGD.html)

# Important Instruction
* Initial configure does not require SSL/HTTPS.This means you can only access your web by HTTP in the beginning.By the way,you can deploy your SSL/HTTPS upon this project.
* Configure document is "/etc/nginx/nginx.conf".
* Start nginx by using "/etc/nginx/sbin/nginx" / ("/etc/nginx/sbin/nginx -s reload") / ("/etc/nginx/sbin/nginx -s stop").
* You can edit "nginx.conf" by yourself such as "Backend for google.com".

# Things you should do before your deployment
* You should run this project by ROOT user.
* Test Port 80 and kill the Pid which uses :80.
```javascript
such as:
* lsof -i :80|grep -v "PID"
* kill {pid}
```
* Ensure your Linux did not install nginx before OR has uninstalled it properly.
* Prepare 2 domains/subdomains for "Google Search" and "Google Scholar".


# Usage:

## For Debain/Ubuntu/Centos
* wget -N --no-check-certificate https://raw.githubusercontent.com/arnofeng/ngx_google_deployment/master/install.sh
* chmod 771 ./install.sh
* bash ./install.sh

# Depend on Projects
* [Nginx](http://nginx.org/)
* [ngx_http_substitutions_filter_module](https://github.com/yaoweibin/ngx_http_substitutions_filter_module)






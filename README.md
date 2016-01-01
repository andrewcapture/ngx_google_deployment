# ngx_google_deployment
* Install Proxy for Google by Nginx
* This project orgins from https://g.adminhost.org

## Things you should do before your deployment
* Test Port 80 and kill the Pid which use :80.
```javascript
such as:
* lsof -i :80|grep -v "PID"
* kill {pid}
```
* Ensure your Linux did not install nginx before OR hqve uninstalled it.
* Prepare 2 domains/subdomains for "Google Search" an "Goole Scholar".

## For Debain/Ubuntu
* wget --no-check-certificate https://raw.githubusercontent.com/arnofeng/ngx_google_deployment/master/Debian/nginx_proxy.sh
* chmod 771
* ./nginx_proxy.sh
* sh nginx_proxy.sh


## For Centos
* wget --no-check-certificate https://raw.githubusercontent.com/arnofeng/ngx_google_deployment/master/Centos/nginx_proxy.sh
* chmod 771
* ./nginx_proxy.sh
* sh nginx_proxy.sh



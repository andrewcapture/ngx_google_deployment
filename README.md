# ngx_google_deployment
* Install Proxy for Google by Nginx.
* This project orgins from g.adminhost.org(can only be accessed by typing the domain).

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
* Prepare 2 domains/subdomains for "Google Search" and "Goole Scholar".


# Usage:

## For Debain/Ubuntu
* wget --no-check-certificate https://raw.githubusercontent.com/arnofeng/ngx_google_deployment/master/Debian/nginx_proxy.sh
* chmod 771 ./nginx_proxy.sh
* sh ./nginx_proxy.sh


## For Centos
* wget --no-check-certificate https://raw.githubusercontent.com/arnofeng/ngx_google_deployment/master/Centos/nginx_proxy.sh
* chmod 771 ./nginx_proxy.sh
* sh ./nginx_proxy.sh


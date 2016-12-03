#Install tengine
yum install gcc gcc-c++ pcre-devel openssl openssl-devel 
cd /usr/local/src
wget http://tengine.taobao.org/download/tengine-2.2.0.tar.gz
tar zxvf tengine-2.2.0.tar.gz
cd tengine-2.2.0
./configure --prefix=/usr --conf-path=/etc/nginx/nginx.conf --pid-path=/var/run/nginx.pid --lock-path=/var/lock/nginx.lock --http-client-body-temp-path=/var/tmp/nginx/client --http-proxy-temp-path=/var/tmp/nginx/proxy --http-fastcgi-temp-path=/var/tmp/nginx/fastcgi --http-scgi-temp-path=/var/tmp/nginx/scgi --http-uwsgi-temp-path=/var/tmp/nginx/uwsgi --with-http_concat_module --with-http_sysguard_module --with-http_stub_status_module
make
make install
/usr/local/nginx/sbin/nginx -t
/usr/local/nginx/sbin/nginx -s start

#Install PHP
yum install php php-fpm
yum install php-pecl-apc php-cli php-pear php-pdo php-mysql php-pecl-mongo php-sqlite php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml

#Install MySQL
sudo yum install mysql mysql-server
sudo /etc/init.d/mysqld restart
sudo /usr/bin/mysql_secure_installation

#Restart Service
sudo chkconfig --levels 235 mysqld on
sudo chkconfig --levels 235 nginx on
sudo chkconfig --levels 235 php-fpm on
sudo service php-fpm restart
sudo service nginx restart
sudo service mysqld restart

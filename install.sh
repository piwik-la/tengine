yum install gcc gcc-c++ pcre-devel openssl openssl-devel 
cd /usr/local/src
wget http://tengine.taobao.org/download/tengine-2.0.3.tar.gz
tar zxvf tengine-2.0.3.tar.gz
cd tengine-2.0.3
./configure
make
make install
/usr/local/nginx/sbin/nginx -t
/usr/local/nginx/sbin/nginx -s start

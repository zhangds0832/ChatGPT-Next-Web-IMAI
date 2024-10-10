```sh
server {
    listen 443 ssl;
    server_name www.toncity.top toncity.top;  # b服务器的域名
     ssl_certificate /usr/share/nginx/html/cert.pem;
     ssl_certificate_key /usr/share/nginx/html/cert.key;
     ssl_session_cache shared:SSL:1m;
     ssl_session_timeout 5m;

    location / {
        proxy_pass http://66.112.217.45;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # 添加 CORS 头
        add_header 'Access-Control-Allow-Origin' '*';
        add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
        add_header 'Access-Control-Allow-Headers' 'Origin, X-Requested-With, Content-Type, Accept, Authorization';

        # 处理预检请求
        if ($request_method = OPTIONS) {
            add_header 'Access-Control-Allow-Origin' '*';
            add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
            add_header 'Access-Control-Allow-Headers' 'Origin, X-Requested-With, Content-Type, Accept, Authorization';
            add_header 'Access-Control-Max-Age' 1728000;
            add_header 'Content-Type' 'text/plain charset=UTF-8';
            add_header 'Content-Length' 0;
            return 204;
        }
     }
}

server {
    listen 3000 ssl;
    server_name  toncity.top www.toncity.top;
    ssl_certificate /usr/share/nginx/html/ssl/toncity.top.crt;
    ssl_certificate_key /usr/share/nginx/html/ssl/toncity.top.key;
    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout 5m;
    gzip on;
    gzip_comp_level 5;          # 压缩级别（1-9），级别越高，压缩越多，但 CPU 使用率也更高
    gzip_min_length 256;        # 最小压缩文件大小（字节）
    gzip_buffers 16 8k;         # 缓冲区大小
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
    gzip_proxied any;           # 允许压缩代理请求的响应
    gzip_vary on;               # 在响应头中添加 `Vary: Accept-Encoding`

    location / {
        proxy_pass http://66.112.217.45;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # 添加 CORS 头
        add_header 'Access-Control-Allow-Origin' '*';
        add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
        add_header 'Access-Control-Allow-Headers' 'Origin, X-Requested-With, Content-Type, Accept, Authorization';

        # 处理预检请求
        if ($request_method = OPTIONS) {
            add_header 'Access-Control-Allow-Origin' '*';
            add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
            add_header 'Access-Control-Allow-Headers' 'Origin, X-Requested-With, Content-Type, Accept, Authorization';
            add_header 'Access-Control-Max-Age' 1728000;
            add_header 'Content-Type' 'text/plain charset=UTF-8';
            add_header 'Content-Length' 0;
            return 204;
        }
     }
}
```
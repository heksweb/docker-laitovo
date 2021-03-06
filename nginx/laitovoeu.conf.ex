server {
    charset utf-8;
    client_max_body_size 128M;

    listen  80;

    server_name  laitovo-eu.loc;
    root        /var/www/html/laitovo;
    index       index.php;

#    access_log  /path/to/basic/log/access.log;
#    error_log   /path/to/basic/log/error.log;

    location /admin/ {
        try_files $uri $uri/ /admin/index.php$is_args$args;
    }

    location /ru_RU/admin/ {
        try_files $uri $uri/ /ru_RU/admin/index.php$is_args$args;
    }

    location /ru_RU/ {
        try_files $uri $uri/ /ru_RU/index.php$is_args$args;
    }

    location /kz_KZ/admin/ {
        try_files $uri $uri/ /kz_KZ/admin/index.php$is_args$args;
    }

    location /kz_KZ/ {
        try_files $uri $uri/ /kz_KZ/index.php$is_args$args;
    }

    location /de_DE/admin/ {
        try_files $uri $uri/ /de_DE/admin/index.php$is_args$args;
    }

    location /de_DE/ {
        try_files $uri $uri/ /de_DE/index.php$is_args$args;
    }

    location /tr_TR/admin/ {
        try_files $uri $uri/ /tr_TR/admin/index.php$is_args$args;
    }

    location /tr_TR/ {
        try_files $uri $uri/ /tr_TR/index.php$is_args$args;
    }

    location /br/ {
        try_files $uri $uri/ /br/index.php$is_args$args;
    }

    location /de/ {
        try_files $uri $uri/ /de/index.php$is_args$args;
    }

    location /en/ {
        try_files $uri $uri/ /en/index.php$is_args$args;
    }

    location /es/ {
        try_files $uri $uri/ /es/index.php$is_args$args;
    }

    location /fr/ {
        try_files $uri $uri/ /fr/index.php$is_args$args;
    }

    location /nl/ {
        try_files $uri $uri/ /nl/index.php$is_args$args;
    }

    location /pt/ {
        try_files $uri $uri/ /pt/index.php$is_args$args;
    }

    location /ru/ {
        try_files $uri $uri/ /ru/index.php$is_args$args;
    }

    location /tr/ {
        try_files $uri $uri/ /tr/index.php$is_args$args;
    }

    location /zh/ {
        try_files $uri $uri/ /zh/index.php$is_args$args;
    }

    location / {
        try_files $uri $uri/ /index.php$is_args$args;
    }

    # uncomment to avoid processing of calls to non-existing static files by Yii
    #location ~ \.(js|css|png|jpg|gif|swf|ico|pdf|mov|fla|zip|rar)$ {
    #    try_files $uri =404;
    #}
    #error_page 404 /404.html;

    # deny accessing php files for the /assets directory
    location ~ ^/assets/.*\.php$ {
        deny all;
    }

    location ~ ^/admin/protected/.*$ {
        deny all;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass php:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }

    location ~* /\. {
        deny all;
    }
}

server {
    charset utf-8;
    client_max_body_size 128M;

    listen  80;

    server_name mlaitovo-eu.loc;
    root        /var/www/html/laitovo3/mobile/web_eu;
    index       index.php;

#    access_log  /path/to/basic/log/access.log;
#    error_log   /path/to/basic/log/error.log;


    location / {
        try_files $uri $uri/ /index.php$is_args$args;
    }

    # uncomment to avoid processing of calls to non-existing static files by Yii
    #location ~ \.(js|css|png|jpg|gif|swf|ico|pdf|mov|fla|zip|rar)$ {
    #    try_files $uri =404;
    #}
    #error_page 404 /404.html;

    # deny accessing php files for the /assets directory
    location ~ ^/assets/.*\.php$ {
        deny all;
    }

    location ~ ^/admin/protected/.*$ {
        deny all;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass php:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }

    location ~* /\. {
        deny all;
    }
}

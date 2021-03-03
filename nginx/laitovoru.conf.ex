server {
    charset utf-8;
    client_max_body_size 128M;

    listen  80;

    server_name  laitovo-ru.loc;
    root        /var/www/html/laitovo/ru_RU;
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
    location ~ ^/(assets|themes)/.*\.php$ {
        deny all;
    }
    location ~ ^/admin/(assets|themes)/.*\.php$ {
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

    server_name mlaitovo-ru.loc;
    root        /var/www/html/laitovo3/mobile/web;
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
    location ~ ^/(assets|themes)/.*\.php$ {
        deny all;
    }
    location ~ ^/admin/(assets|themes)/.*\.php$ {
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

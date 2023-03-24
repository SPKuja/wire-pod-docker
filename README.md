    $ sudo docker run -d --name=wire-pod \
        -v '/apps/wirepod:/wirepod' \
        -p 8080:8080 \
        -p 443:433 \
        -p 8084:8084 \
        --hostname=escapepod \
        --restart=always \
        spkuja/wire-pod

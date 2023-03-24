    $ sudo docker run -d --name=wire-pod \
        -v '/apps/wirepod:/wirepod' \
        -p 8080:8080 \
        -p 443:433 \
        --hostname=escapepod \
        --restart=always \
        spkuja/wire-pod

    $ sudo docker run -d --name=wire-pod \
        -p 80:80 \
        -p 8080:8080 \
        -p 443:433 \
        -p 8084:8084 \
        -v /apps/wire-pod:/wire-pod/data \
        --hostname=escapepod \
        --restart=always \
        spkuja/wire-pod

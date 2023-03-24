    $ sudo docker run -d --name=wire-pod \
        -v '/apps/wirepod:/wirepod' \
        -p 8080:8080 \
        --restart=always\
        spkuja/wire-pod

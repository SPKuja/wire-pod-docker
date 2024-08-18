sudo docker run -d &#92;
  --name=wire-pod &#92;
  -p 80:80 &#92;
  -p 8080:8080 &#92;
  -p 8084:8084 &#92;
  --hostname=escapepod &#92;
  --restart=always &#92;
  spkuja/wire-pod:latest

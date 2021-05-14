## php cli container

Creating a new build with tag '8':

    $ docker build -t php-cli-alpine:8 -f ./Dockerfile .
    $ docker tag php-cli-alpine:8 mmelectrical/php-cli-alpine:8
    $ docker login 
    $ docker push mmelectrical/php-cli-alpine:8

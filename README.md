## php cli alpine container

Creating a new build with tag '8' without multi-arch support:

    $ docker build -t php-cli-alpine:8 -f ./Dockerfile .
    $ docker tag php-cli-alpine:8 mmelectrical/php-cli-alpine:8
    $ docker login 
    $ docker push mmelectrical/php-cli-alpine:8

Creating a new build with tag '8' **with** multi-arch support:

    $ docker buildx build --platform linux/arm64,linux/amd64 --push -t mmelectrical/php-cli-alpine:8 -f ./Dockerfile .

If you see the error "multiple platforms feature is currently not supported for docker drive" above, run the following `$ docker buildx create --use` and then run `docker buildx ls` to make sure `linux/arm64,linux/amd64` is listed.

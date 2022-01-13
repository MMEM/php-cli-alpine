## php cli alpine container

Creating a new build with tag '8' without multi-arch support:

    $ docker build -t php-cli-alpine:8 -f ./Dockerfile .
    $ docker tag php-cli-alpine:8 metalmanufactures/php-cli-alpine:8
    $ docker login 
    $ docker push metalmanufactures/php-cli-alpine:8

Sometimes the base php image bakes in libraries in minor versions. For example the tokenizer library. You can run this to check that:

    $ docker run --rm php:8.0-cli-alpine php -i | grep -i token

Creating a new build with tag '8' **with** multi-arch support:

    $ docker buildx build --platform linux/arm64,linux/amd64 --push -t metalmanufactures/php-cli-alpine:8 -f ./Dockerfile .

If you see the error "multiple platforms feature is currently not supported for docker drive" above, run the following `$ docker buildx create --use` and then run `docker buildx ls` to make sure `linux/arm64,linux/amd64` is listed.

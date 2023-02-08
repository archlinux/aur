# build and test

    docker build . -t aur && docker run -it --rm -e EXPORT_SRC=1 -v $PWD:/pkg aur

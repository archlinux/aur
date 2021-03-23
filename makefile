CC=gcc
CFLAGS=
DESTDIR=/usr/bin
NAME=xbacklight-auto
DEPS= stdio.h stdlib.h sys/ioctl.h getopt.h fcntl.h errno.h sys/mman.h unistd.h stdint.h string.h linux/videodev2.h
all:
	$(CC) xbacklight-auto.c -o $(NAME) $(CFLAGS)
test:
	@ for header in $(DEPS); do printf "found "; ls /usr/include/$$header; done
	@ echo "All dependencies satisfied." 
clean: 
	@rm ./$(NAME)
install:
	@install ./$(NAME) $(DESTDIR)/$(NAME)
uninstall:
	@rm $(DESTDIR)/$(NAME)

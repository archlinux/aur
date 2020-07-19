DIR='/usr/bin'
all:
	gcc TEAtool.c -o TEAtool 
install:
	install ./TEAtool $(DIR)
uninstall:
	rm -f /usr/bin/TEAtool

rus:
	gcc TEAtool.c -o TEAtool -D RUS

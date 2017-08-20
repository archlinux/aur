all: todo

todo: todo.o
	g++ todo.o -o todo

todo.o: todo.cpp
	g++ -std=c++11  -c todo.cpp -o todo.o

.PHONY: clean mrproper

clean:
	rm *.o
	rm todo

mrproper: clean
	rm todo

mrpropest: mrproper
	rm .todo.txt

/usr/bin/todo: todo
	cp ./todo /usr/bin/

install: todo
	@if [ `id -u` == "0" ] ; then cp -f todo /usr/bin/todo ; else \
		if which sudo > /dev/null ; then sudo cp -f todo /usr/bin/todo ; else \
			@echo must be run by superuser ;\
		fi \
	fi
	@echo 'Installation success'

uninstall: /usr/bin/todo
	rm /usr/bin/todo


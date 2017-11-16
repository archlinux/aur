all: todo

todo: todo.o
	c++ todo.o -o todo

todo.o: todo.cpp
	c++ -std=c++11  -c todo.cpp -o todo.o

.PHONY: clean mrproper

clean:
	rm *.o
	rm todo

mrproper: clean
	rm todo

mrpropest: mrproper
	rm .todo.txt

/usr/bin/todo: todo
	@if [ `id -u` == "0" ] ; then cp -f todo /usr/bin/todo ; else \
		if which sudo 1> /dev/null  2> /dev/null ; then cp -f todo /usr/bin/todo ; else \
			echo must be run by superuser ;\
			false ;\
		fi \
	fi

install: /usr/bin/todo
	@echo 'Installation success'

uninstall:
	rm /usr/bin/todo


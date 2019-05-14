CC=gcc
OPTS=-Wall -Wextra -pedantic -std=gnu89 -Ofast
OUT=dlof
IN=main.c

all: $(IN)
	$(CC) $(OPTS) $(IN) -o $(OUT)

clean: 
	rm $(OUT)


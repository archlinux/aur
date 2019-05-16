CC=gcc
OPTS=-Wall -Wextra -pedantic -std=gnu89 -O3
OUT=diss
IN=main.c

all: $(IN)
	$(CC) $(OPTS) $(IN) -o $(OUT)

clean: 
	rm $(OUT)


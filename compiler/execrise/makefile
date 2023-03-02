CC = gcc
OUT = go
OBJ = lex.yy.o y.tab.o
SCANNER = 3.5.4my.lex
PARSER = 3.5.4my.yacc

build: $(OUT)

run: $(OUT)
	./$(OUT) 

clean:
	rm -f *.o lex.yy.c y.tab.c y.tab.h y.output $(OUT)

$(OUT): $(OBJ)
	$(CC) -o $(OUT) -g $(OBJ) 

lex.yy.c: $(SCANNER) y.tab.c
	flex $<

y.tab.c: $(PARSER)
	bison -vdty $<
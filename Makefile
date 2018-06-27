C-: lex.yy.o C-.tab.o
	gcc -o C- $^

C-.tab.h: C-.y
	bison --debug --verbose -d C-.y

C-.tab.c: C-.y
	bison -d C-.y

lex.yy.c: C-.flex C-.tab.h
	flex  C-.flex
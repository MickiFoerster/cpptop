cpptop: cpustat.lex parser.ypp main.cpp Makefile
	flex -o lex.yy.cpp cpustat.lex 
	bison --defines=parser.tab.h -v -o parser.tab.cpp parser.ypp
	g++ -o $@ -std=c++17 -pthread lex.yy.cpp parser.tab.cpp main.cpp

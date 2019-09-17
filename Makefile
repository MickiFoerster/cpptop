parser: cpustat.lex parser.ypp
	flex -o lex.yy.cpp cpustat.lex 
	bison --defines=parser.tab.h -v -o parser.tab.cpp parser.ypp
	g++ lex.yy.cpp parser.tab.cpp -lfl -ly

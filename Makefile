parser: cpustat.lex parser.ypp
	flex -o lex.yy.cpp cpustat.lex 
	bison --defines=parser.tab.h -v -o parser.tab.cpp parser.ypp
	g++ -std=c++17 lex.yy.cpp parser.tab.cpp

CXX?=$$CXX
CXXFLAGS=-Icpustat -std=c++17 -Wall -pthread
cpptop: cpustat/cpustat.lex \
	      cpustat/parser.ypp \
				main.cpp \
				Makefile
	flex -o lex.yy.cpp cpustat/cpustat.lex 
	bison --defines=parser.tab.h -v -o parser.tab.cpp cpustat/parser.ypp
	$(CXX) $(CXXFLAGS) -o $@ lex.yy.cpp parser.tab.cpp main.cpp

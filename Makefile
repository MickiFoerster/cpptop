CXX?=$$CXX
CXXFLAGS=-Icpustat -std=c++17 -Wall -pthread
cpptop: cpustat/cpustat.lex \
	      cpustat/cpustat.ypp \
				main.cpp \
				Makefile
	flex -o cpustat.yy.cpp cpustat/cpustat.lex 
	bison --defines=cpustat.tab.h -v -o cpustat.tab.cpp cpustat/cpustat.ypp
	$(CXX) $(CXXFLAGS) -o $@ cpustat.yy.cpp cpustat.tab.cpp main.cpp

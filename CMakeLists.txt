cmake_minimum_required (VERSION 3.8)

find_program(BISON bison)
find_program(FLEX flex)
find_package (Threads REQUIRED)

message(STATUS "flex: ${FLEX}")
message(STATUS "bison: ${BISON}")

set(CPPTOP cpptop)

add_subdirectory(cpustat)

set (SOURCE main.cpp)

add_executable (${CPPTOP} ${SOURCE})
target_link_libraries(${CPPTOP} cpustat)
target_link_libraries (${CPPTOP} ${CMAKE_THREAD_LIBS_INIT})
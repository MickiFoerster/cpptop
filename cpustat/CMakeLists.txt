
# bison command
get_filename_component(CPUSTAT_BISON_SRC  cpustat.ypp ABSOLUTE)
set(CPUSTAT_BISON_OUT_CPP cpustat.tab.cpp)
set(CPUSTAT_BISON_OUT_H   cpustat.tab.h)
add_custom_command(
	OUTPUT ${CPUSTAT_BISON_OUT_CPP} ${CPUSTAT_BISON_OUT_H}
	COMMAND ${BISON} ARGS --defines=${CPUSTAT_BISON_OUT_H} ${CPUSTAT_BISON_SRC}
	DEPENDS ${CPUSTAT_BISON_SRC} cpustat.h
	)
set(GENERATED_SRCS ${GENERATED_SRCS} ${CPUSTAT_BISON_OUT_CPP} ${CPUSTAT_BISON_OUT_H} )


# flex command
get_filename_component(CPUSTAT_FLEX_SRC cpustat.lex ABSOLUTE)
set(CPUSTAT_FLEX_OUT_CPP cpustat.yy.cpp)
add_custom_command(
	OUTPUT ${CPUSTAT_FLEX_OUT_CPP}
	COMMAND ${FLEX} ARGS --prefix=cpustat -o${CPUSTAT_FLEX_OUT_CPP} ${CPUSTAT_FLEX_SRC}
	DEPENDS ${CPUSTAT_FLEX_SRC} cpustat.h
	)
set(GENERATED_SRCS ${GENERATED_SRCS} ${CPUSTAT_FLEX_OUT_CPP})


# Tell CMake that some files are generated
set_source_files_properties(${GENERATED_SRCS} PROPERTIES GENERATED TRUE)

set (SOURCE ${SOURCE} ${CPUSTAT_FLEX_OUT_CPP})
set (SOURCE ${SOURCE} ${CPUSTAT_BISON_OUT_CPP})

add_library(cpustat ${SOURCE})
target_include_directories(cpustat PRIVATE .)
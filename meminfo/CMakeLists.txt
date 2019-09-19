
# bison command
get_filename_component(MEMINFO_BISON_SRC  meminfo.ypp ABSOLUTE)
set(MEMINFO_BISON_OUT_CPP meminfo.tab.cpp)
set(MEMINFO_BISON_OUT_H   meminfo.tab.h)


add_custom_command(
	OUTPUT ${MEMINFO_BISON_OUT_CPP} ${MEMINFO_BISON_OUT_H}
	COMMAND ${BISON} ARGS --defines=${MEMINFO_BISON_OUT_H} ${MEMINFO_BISON_SRC}
	DEPENDS ${MEMINFO_BISON_SRC} meminfo.h
	)
set(GENERATED_SRCS ${GENERATED_SRCS} ${MEMINFO_BISON_OUT_CPP} ${MEMINFO_BISON_OUT_H} )

# flex command
get_filename_component(MEMINFO_FLEX_SRC meminfo.lex ABSOLUTE)
set(MEMINFO_FLEX_OUT_CPP meminfo.yy.cpp)
add_custom_command(
	OUTPUT ${MEMINFO_FLEX_OUT_CPP}
	COMMAND ${FLEX} ARGS --prefix=meminfo -o${MEMINFO_FLEX_OUT_CPP} ${MEMINFO_FLEX_SRC}
	DEPENDS ${MEMINFO_FLEX_SRC} meminfo.h
	)
set(GENERATED_SRCS ${GENERATED_SRCS} ${MEMINFO_FLEX_OUT_CPP})

# Tell CMake that some files are generated
set_source_files_properties(${GENERATED_SRCS} PROPERTIES GENERATED TRUE)

set (SOURCE ${SOURCE} ${MEMINFO_FLEX_OUT_CPP})
set (SOURCE ${SOURCE} ${MEMINFO_BISON_OUT_CPP})

add_library(meminfo ${SOURCE})
target_include_directories(meminfo PRIVATE .)
if(WIN32)
    set(EXECUTABLE_FLAGS)
endif()

add_executable(ded ${EXECUTABLE_FLAGS} main.cc)
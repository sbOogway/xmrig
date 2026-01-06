set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_C_COMPILER arm-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER arm-linux-gnueabihf-g++)

set(CMAKE_AR arm-linux-gnueabihf-ar)
set(CMAKE_LINKER arm-linux-gnueabihf-ld)
set(CMAKE_NM arm-linux-gnueabihf-nm)
set(CMAKE_RANLIB arm-linux-gnueabihf-ranlib)
set(CMAKE_STRIP arm-linux-gnueabihf-strip)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(ARM_V7 ON)
set(ARM_TARGET 7)

set(CMAKE_SIZEOF_VOID_P 4)

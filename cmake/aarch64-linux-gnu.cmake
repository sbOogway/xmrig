set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

set(CMAKE_C_COMPILER aarch64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER aarch64-linux-gnu-g++)

set(CMAKE_AR aarch64-linux-gnu-ar)
set(CMAKE_LINKER aarch64-linux-gnu-ld)
set(CMAKE_NM aarch64-linux-gnu-nm)
set(CMAKE_RANLIB aarch64-linux-gnu-ranlib)
set(CMAKE_STRIP aarch64-linux-gnu-strip)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(ARM_V8 ON)
set(ARM_TARGET 8)

set(CMAKE_SIZEOF_VOID_P 8)

set(XMRIG_DEPS ${CMAKE_SOURCE_DIR}/deps)

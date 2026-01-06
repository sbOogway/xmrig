HWLOC_VERSION_MAJOR="2"
HWLOC_VERSION_MINOR="12"
HWLOC_VERSION_PATCH="1"

HWLOC_VERSION="${HWLOC_VERSION_MAJOR}.${HWLOC_VERSION_MINOR}.${HWLOC_VERSION_PATCH}"

mkdir -p deps
mkdir -p deps/include
mkdir -p deps/lib

mkdir -p build && cd build

wget https://download.open-mpi.org/release/hwloc/v${HWLOC_VERSION_MAJOR}.${HWLOC_VERSION_MINOR}/hwloc-${HWLOC_VERSION}.tar.gz -O hwloc-${HWLOC_VERSION}.tar.gz
tar -xzf hwloc-${HWLOC_VERSION}.tar.gz

cd hwloc-${HWLOC_VERSION}
export CC=aarch64-linux-gnu-gcc
export CXX=aarch64-linux-gnu-g++
./configure --disable-shared --enable-static --disable-io --disable-libudev --disable-libxml2 --host=aarch64-linux-gnu --prefix=$PWD/../../deps
make -j$(nproc || sysctl -n hw.ncpu || sysctl -n hw.logicalcpu)
cp -fr include ../../deps
cp hwloc/.libs/libhwloc.a ../../deps/lib
cd ..

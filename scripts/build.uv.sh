UV_VERSION="1.51.0"
UV_VERSION=$(echo $UV_VERSION | tr -d '\r')

mkdir -p deps
mkdir -p deps/include
mkdir -p deps/lib

mkdir -p build && cd build

wget https://dist.libuv.org/dist/v${UV_VERSION}/libuv-v${UV_VERSION}.tar.gz -O v${UV_VERSION}.tar.gz
# wget https://github.com/libuv/libuv/archive/refs/tags/v${UV_VERSION}.tar.gz -O v${UV_VERSION}.tar.gz
tar -xzf v${UV_VERSION}.tar.gz

cd libuv-v${UV_VERSION}
sh autogen.sh
export CC=aarch64-linux-gnu-gcc
export CXX=aarch64-linux-gnu-g++
./configure --disable-shared --host=aarch64-linux-gnu --prefix=$PWD/../../deps
make -j$(nproc || sysctl -n hw.ncpu || sysctl -n hw.logicalcpu)
cp -fr include ../../deps
cp .libs/libuv.a ../../deps/lib
cd ..

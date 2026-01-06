OPENSSL_VERSION="1.1.1u"

mkdir -p deps
mkdir -p deps/include
mkdir -p deps/lib

mkdir -p build && cd build

wget https://openssl.org/source/old/1.1.1/openssl-${OPENSSL_VERSION}.tar.gz -O openssl-${OPENSSL_VERSION}.tar.gz
tar -xzf openssl-${OPENSSL_VERSION}.tar.gz

cd openssl-${OPENSSL_VERSION}
export CC=aarch64-linux-gnu-gcc
export CXX=aarch64-linux-gnu-g++
./Configure linux-aarch64 -no-shared -no-asm -no-zlib -no-comp -no-dgram -no-filenames -no-cms --prefix=$PWD/../../deps
make -j$(nproc || sysctl -n hw.ncpu || sysctl -n hw.logicalcpu)
make install
cd ..

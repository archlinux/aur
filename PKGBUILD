# Maintainer: HappyClown <giganitris at gmail dot com>
pkgname=corrupt
pkgver=A.1.3.2
pkgrel=1
pkgdesc="ROM corruptor for multiple operating systems."
url="https://sourceforge.net/projects/corrupter-for-linux/"
arch=('any')
source=("http://downloads.sourceforge.net/project/corrupter-for-linux/Source%20Code/A.1.3.2.cpp" "http://downloads.sourceforge.net/project/corrupter-for-linux/Source%20Code/Portable.h")
md5sums=("d3d062d3ca245a04f8c55b756fda5982" "1ff4ef1e53bd3171cf864b9be2ae3f3b")

build() {
cd ..
make
}

check(){
echo "Nothing to check."
}

package() {
cd ..
mkdir $pkgdir/usr
mkdir $pkgdir/usr/bin
cp corrupt $pkgdir/usr/bin
}

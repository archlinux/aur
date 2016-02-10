# Maintainer: HappyClown <giganitris at gmail dot com>
pkgname=corrupt
pkgver=A.0.2.2
pkgrel=1
pkgdesc="Linux ROM corruptor."
url="https://sourceforge.net/projects/corrupter-for-linux/"
arch=('any')
source=("http://downloads.sourceforge.net/project/corrupter-for-linux/Source%20Code/A.0.2.2.cpp")
md5sums=("24557f15287b959e17e273ac3823d050")

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

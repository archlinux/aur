# Maintainer: HappyClown <giganitris at gmail dot com>
pkgname=corrupt
pkgver=A.1.5.8
pkgrel=1
pkgdesc="ROM corruptor for multiple operating systems."
url="https://sourceforge.net/projects/corrupter-for-linux/"
arch=('any')
makedepends=('p7zip')
source=("http://downloads.sourceforge.net/project/corrupter-for-linux/English/A.1.5.8.7z")
md5sums=("edd1df492d5f42f000c184e374532951")

build() {
cd ..
7z x "A.1.5.8.7z"
cd "Source Code"
make
}

check(){
echo "Nothing to check."
}

package() {
cd ..
mkdir $pkgdir/usr
mkdir $pkgdir/usr/bin
cd "Source Code"
cp corrupt $pkgdir/usr/bin
}

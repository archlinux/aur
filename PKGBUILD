# Maintainer: Ryan Medeiros <giganitris at gmail dot com>
pkgname=corrupt
pkgver=B.0.1.0
pkgrel=1
pkgdesc="Corrupter for ROM files."
url="https://sourceforge.net/projects/corrupter-for-linux/"
arch=('any')
source=("http://downloads.sourceforge.net/project/corrupter-for-linux/src/main.cpp")
md5sums=("51d6c0b7820aa0fb7b10b79430b1b8d0")

build() {
g++ main.cpp -o corrupt
}

package() {
sudo install $srcdir/corrupt /usr/bin/
}

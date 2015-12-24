# Maintainer: Ryan Medeiros <giganitris at gmail dot com>
pkgname=corrupt
pkgver=B.0.2.0
pkgrel=1
pkgdesc="Linux ROM corruptor."
url="https://sourceforge.net/projects/corrupter-for-linux/"
arch=('any')
source=("http://downloads.sourceforge.net/project/corrupter-for-linux/src/main.cpp")
md5sums=("4d90363ae280bdbef4be487b575c26c2")

build() {
g++ main.cpp -o corrupt
}

package() {
sudo install $srcdir/corrupt /usr/bin/
}

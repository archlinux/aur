# Maintainer: Ryan Medeiros <giganitris at gmail dot com>
pkgname=corrupt
pkgver=A.0.2.1
pkgrel=1
pkgdesc="Linux ROM corruptor."
url="https://sourceforge.net/projects/corrupter-for-linux/"
arch=('any')
source=("http://downloads.sourceforge.net/project/corrupter-for-linux/src/main.cpp")
md5sums=("fae1c779d63e59bedf75f62e73466a7e")

build() {
g++ main.cpp -o corrupt
}

package() {
sudo install $srcdir/corrupt /usr/bin/
}

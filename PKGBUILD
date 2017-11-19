# Maintainer: smlb <smlb at riseup dot net>

pkgname=libthinkpad
pkgver=2.0
pkgrel=1
pkgdesc="A general purpose userspace ThinkPad library"
arch=('i686' 'x86_64')
url="https://github.com/libthinkpad/libthinkpad"
license=('BSD-2')
depends=('cmake' 'systemd')
source=("https://github.com/libthinkpad/$pkgname/archive/$pkgver.tar.gz")
md5sums=('80d1a19ea47dc42e3a9cf4f4ee745edb')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/src"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    sudo make install
}


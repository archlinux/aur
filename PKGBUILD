pkgname=shortcut-satan
pkgver=2
pkgrel=1
pkgdesc='Global shortcut program like hotkey daemon, but better'
url='https://github.com/sandsmark/shortcut-satan'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=('gcc')
depends=('systemd-libs') # udev
source=("https://github.com/sandsmark/shortcut-satan/archive/${pkgver}.tar.gz")

build() {
    cd shortcut-satan-${pkgver}
    make
}

package() {
    cd shortcut-satan-${pkgver}
    make install DESTDIR="${pkgdir}"
}
md5sums=('e86ba464982dc3db62a9a7a0e00c9cd5')

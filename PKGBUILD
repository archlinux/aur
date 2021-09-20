# Maintainer: Ayush Agarwal <ayush at fastmail dot in>

pkgname=tessen
pkgver=1.0
_pkgver=1.0.0
pkgrel=1
pkgdesc="An interactive menu to autotype and copy password-store data"
arch=(x86_64)
url="https://github.com/ayushnix/tessen"
license=('GPL')
depends=('pass'
         'bemenu'
         'wtype'
         'wl-clipboard'
         'libnotify')
optdepends=('rofi-lbonn-wayland-git: the wayland native fork of rofi'
            'rofi: Xorg rofi for use in xwayland mode')
conflicts=('tessen-git')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/ayushnix/tessen/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('ab41014d6a16bd33cbf7fe33e09f55b5f0031f8844d9f907c454043522512195')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}

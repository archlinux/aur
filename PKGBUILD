# Maintainer: Ayush Agarwal <ayush at fastmail dot in>

pkgname=tessen
pkgver=1.1.1
_pkgver=1.1.1
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
            'wofi: unmaintained gtk based backend')
conflicts=('tessen-git')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/ayushnix/tessen/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('30671b4e9333d7f61ff39f671c67ac9dfef38e500e14accf131cfdd1c9df9ffe')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}

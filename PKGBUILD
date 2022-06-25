# Maintainer: Rouven Himmelstein <rouvenhimmelstein@gmail.com>

_pkgname=chwp
pkgname=${_pkgname}-bin
url="https://github.com/RouHim/chwp"
pkgver=1.49.0
pkgrel=1
pkgdesc="Changes the background wallpaper and lockscreen from the command line."
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('xorg-xrandr')
provides=('chwp')
conflicts=('chwp')
source=("${_pkgname}::${url}/releases/download/v$pkgver/${_pkgname}-linux-x86_64")
noextract=('${_pkgname}-linux-x86_64')
sha1sums=('SKIP')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/${_pkgname}"
}
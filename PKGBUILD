# Maintainer: Rouven Himmelstein <rouvenhimmelstein@gmail.com>

_pkgname=chwp
pkgname=${_pkgname}-bin
url="https://github.com/RouHim/chwp"
pkgver=1.163.0
pkgrel=1
pkgdesc="Changes the background wallpaper and lockscreen from the command line."
arch=('x86_64')
license=('GPL-3.0-or-later')
provides=('chwp')
conflicts=('chwp')
source=("${_pkgname}::${url}/releases/download/v$pkgver/${_pkgname}-linux-x86-64")
noextract=('${_pkgname}-linux-x86-64')
sha1sums=('SKIP')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/${_pkgname}"
}
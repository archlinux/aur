# Maintainer: Alex Grabowski <hurufu+aur@gmail.com>
pkgname=dgks-prolog
pkgver=1.0
pkgrel=1
pkgdesc='Historical (1998) Prolog implementation written in Java'
arch=(any)
url='https://web.archive.org/web/20091027030150/http://geocities.com/SiliconValley/Campus/7816/'
license=(LGPL-3.0-or-later)
depends=(java-runtime)
source=(https://web.archive.org/web/20091024003523/http://geocities.com/SiliconValley/Campus/7816/PrologO.zip)
noextract=(PrologO.zip)
sha256sums=('3fc3fa7ca1397b97358be9c548643969299bb9ad358e92bb9000610f09bc89ce')

package() {
    install -m644 -Dt "$pkgdir/usr/share/java/$pkgname" "$srcdir/PrologO.zip"
}

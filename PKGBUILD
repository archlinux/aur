# Maintainer: 0x715C <https://www.t.me/hex715C>

pkgname=alda-bin
_pkgname=alda
pkgver=1.2.0
pkgrel=1
pkgdesc='A music programming language for musicians. 🎶'
arch=('x86_64')
url='https://github.com/alda-lang/alda'
license=('EPL')
provides=('alda')
conflicts=('alda')
options=('!strip')
source=("https://github.com/$_pkgname-lang/$_pkgname/releases/download/$pkgver/$_pkgname")
sha256sums=('9c24d2c5791674cac3bd8b40ff67b17a132713a5d1c32d5e3e944a988e24f142')
noextract=('alda')

package() {
  cd "$srcdir"
  install -Dm755 alda \
    "${pkgdir}/usr/bin/${_pkgname}"
}

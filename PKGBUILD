# Maintainer: 0x715C <https://www.t.me/hex715C>

pkgname=alda-bin
_pkgname=alda
pkgver=1.4.4
pkgrel=1
pkgdesc='A music programming language for musicians. 🎶'
arch=('x86_64')
url='https://github.com/alda-lang/alda'
license=('EPL')
provides=('alda')
conflicts=('alda')
options=('!strip')
source=("https://github.com/$_pkgname-lang/$_pkgname/releases/download/$pkgver/$_pkgname")
sha256sums=('cc8abc7284a1e01f551ab8b19107e1c922bbaa19451b6a7b3b4b2ebdb89270a6')
noextract=('alda')

package() {
  cd "$srcdir"
  install -Dm755 alda \
    "${pkgdir}/usr/bin/${_pkgname}"
}

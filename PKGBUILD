# Maintainer: SoniEx2 <endermoneymod at gmail dot com>
pkgname=lit
pkgver=3.4.2
pkgrel=1
pkgdesc="Toolkit for developing, sharing, and running luvit/lua programs and libraries."
arch=(i686 x86_64)
url="https://github.com/luvit/lit"
license=('Apache')
groups=()
depends=('gcc-libs')
makedepends=('luvi')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("lit.zip::https://lit.luvit.io/packages/luvit/lit/v$pkgver.zip")
noextract=("lit.zip")
sha256sums=('08c02bf970f6d55d9decc1bc8cab3db4e4fc0423bdc14ca90f1986ddaeb90e58')

build() {
  cd "$srcdir"

  luvi lit.zip -- make lit.zip
}

package() {
  cd "$srcdir"

  install -Dm755 lit "$pkgdir/usr/bin/lit"
}

# Maintainer: SoniEx2 <endermoneymod at gmail dot com>
pkgname=luvit
pkgver=2.11.4
pkgrel=1
pkgdesc="node.js style APIs for luvi as either a luvi app or library."
arch=(i686 x86_64)
url="https://github.com/luvit/luvit"
license=('Apache')
groups=()
depends=('gcc-libs')
makedepends=('lit')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("luvit.zip::https://lit.luvit.io/packages/luvit/luvit/v$pkgver.zip")
noextract=("luvit.zip")
sha256sums=('d564330480ca755a15b158a36dfa2b87ba8b93ec9f6206f99da1ce4a789fb431')

build() {
  cd "$srcdir"

  lit make luvit.zip
}

package() {
  cd "$srcdir"

  install -Dm755 luvit "$pkgdir/usr/bin/luvit"
}

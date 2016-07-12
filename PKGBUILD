# Maintainer: SoniEx2 <endermoneymod at gmail dot com>
pkgname=luvi-bin
pkgver=2.7.3
pkgrel=1
pkgdesc="A project in-between luv and luvit"
arch=(i686 x86_64)
url="https://github.com/luvit/luvi"
license=('Apache')
groups=()
depends=('gcc-libs')
makedepends=()
optdepends=()
provides=(luvi)
conflicts=(luvi)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/luvit/luvi/releases/download/v$pkgver/luvi-regular-Linux_$CARCH")
noextract=()
sha256sums=('SKIP')

package() {
  cd "$srcdir"

  install -Dm755 luvi-regular-Linux_x86_64 "$pkgdir/usr/bin/luvi"
}

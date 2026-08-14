# Maintainer: Tim Culverhouse <tim@timculverhouse.com>
pkgname=monstar-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="wayland terminal based on libghostty"
arch=('x86_64')
url="https://github.com/rockorager/monstar"
license=('MIT')
provides=('monstar')
conflicts=('monstar')
depends=(
  'wayland'
  'fontconfig'
  'freetype2'
  'harfbuzz'
  'libxkbcommon'
  'dbus'
)
optdepends=(
  'noto-fonts-emoji: emoji support'
  'noto-fonts-cjk: CJK font support'
)
source=("monstar-1.0.0-x86_64-linux.tar.gz::https://github.com/rockorager/monstar/releases/download/v1.0.0/monstar-1.0.0-x86_64-linux.tar.gz")
sha256sums=('d60944d16939ca5e0161c2c7dd183f28d4cee8101bb973f400c8521e38bef81f')

build() {
  :
}

package() {
  cd "$srcdir/monstar-${pkgver}-x86_64-linux"
  mkdir -p "$pkgdir/usr"
  cp -r bin share "$pkgdir/usr/"
}

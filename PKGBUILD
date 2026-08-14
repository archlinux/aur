# Maintainer: Tim Culverhouse <tim@timculverhouse.com>
pkgname=monstar-bin
pkgver=1.0.1
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
source=("monstar-1.0.1-x86_64-linux.tar.gz::https://github.com/rockorager/monstar/releases/download/v1.0.1/monstar-1.0.1-x86_64-linux.tar.gz")
sha256sums=('271fcf68d3e67350327eba43c061f0bd904ec4e5a7049ee60d7c9e79991d4bbc')

build() {
  :
}

package() {
  cd "$srcdir/monstar-${pkgver}-x86_64-linux"
  mkdir -p "$pkgdir/usr"
  cp -r bin share "$pkgdir/usr/"
}

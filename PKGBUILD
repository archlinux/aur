# Maintainer: posprint contributors
pkgname=posprint-bin
pkgver=0.5.8
pkgrel=1
pkgdesc="Designer for POS-print documents with live preview and USB ESC/POS printing (prebuilt binary)"
arch=('x86_64')
url="https://gitlab.com/Timfa/posprint"
license=('MIT')
depends=(
  'gcc-libs'
  'libxkbcommon'
  'libxcb'
  'openssl'
  'dbus'
  'wayland'
  'libx11'
  'fontconfig'
  'freetype2'
  'libglvnd'
)
provides=("posprint=${pkgver}")
conflicts=('posprint')
options=('!strip' '!debug')
source=("posprint-${pkgver}-x86_64.tar.gz::https://gitlab.com/api/v4/projects/Timfa%2Fposprint/packages/generic/posprint/${pkgver}/posprint-${pkgver}-x86_64.tar.gz")
sha256sums=('2146c5385af1fbcaad242e896566743c312843842d457f6ad8c0add96644bff5')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}

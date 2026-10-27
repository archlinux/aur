# Maintainer: posprint contributors
pkgname=posprint-bin
pkgver=0.5.9
pkgrel=1
pkgdesc="Designer for POS-print documents with live preview and USB ESC/POS printing (prebuilt binary)"
arch=('x86_64')
url="https://git.timfalken.com/timfa/posprint"
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
source=("posprint-${pkgver}-x86_64.tar.gz::https://git.timfalken.com/timfa/posprint/-/releases/${pkgver}/assets/posprint-${pkgver}-x86_64.tar.gz")
sha256sums=('112ccb90e72d378b637041341195c872a086f8bf4df789c843ed9e681174fe4f')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}

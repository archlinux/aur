# Maintainer: Minnow Contributors <noreply@example.com>
pkgname=minnow-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="A simple, lightweight file manager for KDE (prebuilt binary)"
arch=('x86_64')
url="https://github.com/minnowfm/minnow"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'kcoreaddons' 'kconfigwidgets' 'kwidgetsaddons' 'kio' 'kfilemetadata' 'karchive' 'knotifications' 'kwindowsystem')
provides=('minnow')
conflicts=('minnow')
# grabs the tarball built by the release workflow (archlinux:latest container, so ABI matches)
source=("$pkgname-$pkgver.tar.gz::https://github.com/minnowfm/minnow/releases/download/v$pkgver/minnow-v$pkgver-x86_64.tar.gz")
sha256sums=('4700fd92b452952345d9dd8f5a2d3a95037ca01c69e50954ba51d176da94c9e4')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}

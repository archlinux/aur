# Maintainer: Minnow Contributors <noreply@example.com>
pkgname=minnow-bin
pkgver=0.1.7
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
sha256sums=('83a3925619b1a5253dd968c7a43d434470f01dd6f3091782132d4d2dcee5c6f4')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}

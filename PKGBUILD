# Maintainer: Minnow Contributors <noreply@example.com>
pkgname=minnow-bin
pkgver=0.1.5.2
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
sha256sums=('087e4e1168601df54afa695ed18291d5dd0bb0f0f61708f2b2d0e3e37220b15d')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}

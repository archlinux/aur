# Maintainer: Minnow Contributors <noreply@example.com>
pkgname=minnow-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="A simple, lightweight file manager for KDE (prebuilt binary)"
arch=('x86_64')
url="https://github.com/minnowfm/minnow"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'kcoreaddons' 'kconfigwidgets' 'kwidgetsaddons' 'kio' 'kfilemetadata' 'karchive' 'knotifications')
provides=('minnow')
conflicts=('minnow')
# grabs the tarball built by the release workflow (archlinux:latest container, so ABI matches)
source=("$pkgname-$pkgver.tar.gz::https://github.com/minnowfm/minnow/releases/download/v$pkgver/minnow-v$pkgver-x86_64.tar.gz")
sha256sums=('ea5844763eae7bebacba751b1572349f07df9d805a30b1a0730064f00d874aa8')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}

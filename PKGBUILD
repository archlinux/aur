# Maintainer: Minnow Contributors <noreply@example.com>
pkgname=minnow-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple, lightweight file manager for KDE (prebuilt binary)"
arch=('x86_64')
url="https://forgejo.voten.me/Voten641/minnow"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'kcoreaddons' 'kconfigwidgets' 'kwidgetsaddons' 'kio' 'kfilemetadata' 'karchive' 'knotifications' 'kwindowsystem')
provides=('minnow')
conflicts=('minnow')
# grabs the tarball built by the Forgejo release-binary workflow (archlinux:latest container, so ABI matches)
source=("$pkgname-$pkgver.tar.gz::https://forgejo.voten.me/Voten641/minnow/releases/download/v$pkgver/minnow-v$pkgver-x86_64.tar.gz")
sha256sums=('b55e4ab2538dc721b6ca886155d374317099b879e7a73482c3edc6df9135a45c')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}

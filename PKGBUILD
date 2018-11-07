# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=matterhorn-bin
pkgver=50200.0.0
pkgrel=1
pkgdesc="A terminal-based chat client for MatterMost"
arch=('x86_64')
url="https://github.com/matterhorn-chat/matterhorn"
license=('BSD')
provides=('matterhorn-bin')
conflicts=('matterhorn' 'matterhorn-git')
depends=('ncurses5-compat-libs')
source=("https://github.com/matterhorn-chat/matterhorn/releases/download/${pkgver}/matterhorn-${pkgver}-ubuntu-x86_64.tar.bz2")
sha1sums=('b5c3baa6b9de25b938da2624ec4631f6398d87ff')

package() {
  cd "$srcdir/matterhorn-$pkgver-Ubuntu-x86_64"
  mkdir -p "$pkgdir/usr/bin"
  cp matterhorn "$pkgdir/usr/bin"
}

# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=matterhorn-bin
pkgver=40901.0.0
pkgrel=1
pkgdesc="A terminal-based chat client for MatterMost"
arch=('x86_64')
url="https://github.com/matterhorn-chat/matterhorn"
license=('BSD')
provides=('matterhorn-bin')
conflicts=('matterhorn' 'matterhorn-git')
depends=('ncurses5-compat-libs')
source=("https://github.com/matterhorn-chat/matterhorn/releases/download/${pkgver}/matterhorn-${pkgver}-ubuntu-x86_64.tar.bz2")
sha1sums=('558245deb32851cb39df761cfc40fed887e75990')

package() {
  cd "$srcdir/matterhorn-$pkgver-Ubuntu-x86_64"
  mkdir -p "$pkgdir/usr/bin"
  cp matterhorn "$pkgdir/usr/bin"
}

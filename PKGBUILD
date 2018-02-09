# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=matterhorn
pkgver=40600.1.0
pkgrel=1
pkgdesc="A terminal-based chat client for MatterMost"
arch=('x86_64')
url="https://github.com/matterhorn-chat/matterhorn"
license=('BSD')
provides=('matterhorn')
conflicts=('matterhorn-git')
depends=('ncurses5-compat-libs')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/matterhorn-chat/matterhorn/releases/download/${pkgver}/matterhorn-${pkgver}-ubuntu-x86_64.tar.bz2")
sha1sums=('d1f6a96e83996c3d61a2e25039f4c737b44a89ac')
noextract=()

package() {
  cd "$srcdir/$pkgname-$pkgver-Ubuntu-x86_64"
  mkdir -p "$pkgdir/usr/bin"
  cp matterhorn "$pkgdir/usr/bin"
}

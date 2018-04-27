# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=matterhorn
pkgver=40900.0.0
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
sha1sums=('e3d485f9d21213553e4f76e3f3fa6542cdcb9106')
noextract=()

package() {
  cd "$srcdir/$pkgname-$pkgver-Ubuntu-x86_64"
  mkdir -p "$pkgdir/usr/bin"
  cp matterhorn "$pkgdir/usr/bin"
}

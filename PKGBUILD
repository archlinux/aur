# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=matterhorn
pkgver=31000.0.0
pkgrel=1
pkgdesc="A terminal-based chat client for MatterMost"
arch=('x86_64')
url="https://github.com/matterhorn-chat/matterhorn"
license=('BSD')
provides=('matterhorn')
conflicts=('matterhorn-git')
depends=('libtinfo')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/matterhorn-chat/matterhorn/releases/download/31000.0.0/matterhorn-31000.0.0-ubuntu-x86_64.tar.gz")
md5sums=('f52d218a1744060cbead80cf701d02e7')
noextract=()

package() {
  cd "$srcdir/$pkgname-$pkgver-ubuntu-x86_64"
  mkdir -p "$pkgdir/usr/bin"
  cp matterhorn "$pkgdir/usr/bin"
}

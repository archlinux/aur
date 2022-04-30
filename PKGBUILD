# Maintainer: Funami
pkgname=git-interactive-rebase-tool-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Native cross-platform full feature terminal-based sequence editor for git interactive rebase"
arch=('x86_64')
url="https://github.com/MitMaro/git-interactive-rebase-tool"
license=('GPL3')
provides=('git-interactive-rebase-tool')
conflicts=('git-interactive-rebase-tool')
install=git-interactive-rebase-tool.install
source=("https://github.com/MitMaro/git-interactive-rebase-tool/releases/download/$pkgver/git-interactive-rebase-tool-$pkgver-debian-bullseye_amd64.deb")
sha256sums=('22004c8330c9caab0849d22cfe7f900ac737445ccc0712a06e6d26b300dc0944')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  rm -r "$pkgdir/usr/share/doc/git-interactive-rebase-tool"
  rm "$pkgdir/usr/share/doc/interactive-rebase-tool/readme/install.md"
}

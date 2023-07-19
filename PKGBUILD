# Maintainer: Funami
pkgname=git-interactive-rebase-tool-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Native cross-platform full feature terminal-based sequence editor for git interactive rebase"
arch=('x86_64')
url="https://github.com/MitMaro/git-interactive-rebase-tool"
license=('GPL3')
provides=('git-interactive-rebase-tool')
conflicts=('git-interactive-rebase-tool')
install=git-interactive-rebase-tool.install
source=("https://github.com/MitMaro/git-interactive-rebase-tool/releases/download/$pkgver/git-interactive-rebase-tool-$pkgver-debian-sid_amd64.deb")
sha256sums=('95aba1b735c8bfb2a98712d3a9c07b726f2a2bc172ae5eb283d1af3cd1a0c6cb')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  rm -r "$pkgdir/usr/share/doc/git-interactive-rebase-tool"
  rm "$pkgdir/usr/share/doc/interactive-rebase-tool/readme/install.md"
}

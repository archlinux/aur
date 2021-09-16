# Maintainer: Funami
pkgname=git-interactive-rebase-tool-bin
pkgver=2.1.0
pkgrel=3
pkgdesc="Native cross-platform full feature terminal-based sequence editor for git interactive rebase"
arch=('x86_64')
url="https://github.com/MitMaro/git-interactive-rebase-tool"
license=('GPL3')
provides=('git-interactive-rebase-tool')
conflicts=('git-interactive-rebase-tool')
install=git-interactive-rebase-tool.install
source=("https://github.com/MitMaro/git-interactive-rebase-tool/releases/download/$pkgver/git-interactive-rebase-tool-$pkgver-debian-bullseye_amd64.deb")
sha256sums=('4ac6c112b7b9a60207df4be9b17d68c0fa053b23871c410a8187c397673387b2')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  rm -rf "$pkgdir/usr/share/doc/git-interactive-rebase-tool"
  rm "$pkgdir/usr/share/doc/interactive-rebase-tool/readme/install.md"
}

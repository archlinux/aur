# Maintainer: Funami
pkgname=git-interactive-rebase-tool-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="Native cross-platform full feature terminal-based sequence editor for git interactive rebase"
arch=('x86_64')
url="https://github.com/MitMaro/git-interactive-rebase-tool"
license=('GPL3')
provides=('git-interactive-rebase-tool')
conflicts=('git-interactive-rebase-tool')
install=git-interactive-rebase-tool.install
source=("https://github.com/MitMaro/git-interactive-rebase-tool/releases/download/$pkgver/git-interactive-rebase-tool-$pkgver-debian-sid_amd64.deb")
sha256sums=('bcc69e00d20d0d42e4225b10f0fbe19742c19e141141593ef74304a02b502556')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  rm -r "$pkgdir/usr/share/doc/git-interactive-rebase-tool"
  rm "$pkgdir/usr/share/doc/interactive-rebase-tool/readme/install.md"
}

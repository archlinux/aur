# Maintainer: Funami
pkgname=git-interactive-rebase-tool-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="Native cross-platform full feature terminal-based sequence editor for git interactive rebase"
arch=('x86_64')
url="https://github.com/MitMaro/git-interactive-rebase-tool"
license=('GPL3')
provides=('git-interactive-rebase-tool')
conflicts=('git-interactive-rebase-tool')
install=git-interactive-rebase-tool.install
source=("https://github.com/MitMaro/git-interactive-rebase-tool/releases/download/$pkgver/git-interactive-rebase-tool-$pkgver-debian-sid_amd64.deb")
sha256sums=('18ab32efd614292372edc3a1d824f03fce127d49c9f9dc6b049d99a58ce7c194')

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  rm -r "$pkgdir/usr/share/doc/git-interactive-rebase-tool"
  rm "$pkgdir/usr/share/doc/interactive-rebase-tool/readme/install.md"
}

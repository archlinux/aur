# Maintainer: Fredrik Angelsen <fredrikangelsen@gmail.com>
pkgname=fzf2md
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple fzf-based file selection tool for Markdown conversion with Git-aware functionality."
arch=('any')
url="https://github.com/angelsen/fzf2md"
license=('MIT')
depends=('fzf' 'git')
source=("fzf2md")
sha256sums=('dfe9d2049c9a1232a4465ba8ef9d25cc0e6ebef34d6dfacfa9299297ec06ba45')

package() {
    install -Dm755 "$srcdir/fzf2md" "$pkgdir/usr/bin/fzf2md"
}

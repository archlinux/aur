# Maintainer: Roddy Rappaport <roddy.rappaport@gmail.com>

pkgname=git-hash-select
pkgver=0.1.2
pkgrel=1

pkgdesc="A hash selector utility for bash with optional shell bindings"
arch=(any)
url="https://github.com/roddyrap/git-hash-select"
license=('MIT')

depends=('git' 'fzf' 'util-linux')
optdepends=('xclip: X11 copy to clipboard support')

source=("git-hash-select::git+https://github.com/roddyrap/git-hash-select.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
	cd "${srcdir}/git-hash-select/"
	./install.sh "$pkgdir"
}

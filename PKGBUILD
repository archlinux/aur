# Maintainer: BartSte bartsteensma@outlook.com

pkgname=fzf-help
pkgver=2.1.1
pkgrel=2
pkgdesc="Use fzf to select command line options from --help"
arch=('any')
url="https://github.com/BartSte/fzf-help"
license=('MIT')
depends=('fzf' 'bat')
makedepends=('git')
source=("$pkgname::git+https://github.com/BartSte/fzf-help.git")
md5sums=('SKIP')
changelog="CHANGELOG.md"

package() {
    "$srcdir/$pkgname/install"
}

pre_remove() {
    "$srcdir/$pkgname/uninstall"
}

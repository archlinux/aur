# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=i3tree-git
pkgver=7cb81e0
pkgrel=1
epoch=
pkgdesc="Human-friendly display of i3's tree layout"
arch=('any')
url="https://github.com/sciurus/i3tree"
license=('GPL')
groups=()
depends=('perl-anyevent-i3')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname::git+https://github.com/sciurus/i3tree.git)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git rev-parse --short master
}

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "$pkgdir/usr/bin/"
    cp i3tree "$pkgdir/usr/bin/"
}

# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantcursors
pkgname=$_pkgname
pkgver=20204208429760e
pkgrel=1
pkgdesc="Cursors for instantOS"
url="https://github.com/paperbenni/cursors"
arch=('any')
license=('MIT')
depends=('sh')
makedepends=('git')
provides=(instantcursors)
conflicts=(instantcursors)
source=("$_pkgname::git+https://github.com/paperbenni/cursors.git")

sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
    cd $_pkgname
    echo "no prepare"
}

build() {
    cd $_pkgname
    echo "no build"
}

package() {
    cd $_pkgname
    mkdir -p ${pkgdir}/usr/share/icons
    rm README.md
    rm install.sh
    rm -rf .git
    mv ./* ${pkgdir}/usr/share/icons
}

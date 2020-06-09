# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantwidgets
pkgname=$_pkgname
pkgver=20204208429760e
pkgrel=1
pkgdesc="Conky widgets for instantOS"
url="https://github.com/instantOS/instantWIDGETS"
arch=('any')
license=('MIT')
depends=('bash' 'conky')
makedepends=('git')
provides=(instantwidgets)
conflicts=(instantwidgets)
source=("$_pkgname::git+https://github.com/instantOS/instantwidgets.git")

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
    mkdir -p ${pkgdir}/usr/share/instantwidgets
    rm README.md
    mv ./* ${pkgdir}/usr/share/instantwidgets/
}

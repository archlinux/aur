# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=imenu
pkgname=$_pkgname
pkgver=9851542
pkgrel=1
pkgdesc="simple ui scripts using instantMENU"
url="https://github.com/instantOS/imenu"
arch=('any')
license=('MIT')
depends=('instantmenu')
makedepends=('git')
provides=(imenu)
conflicts=(imenu)
source=("$_pkgname::git+https://github.com/instantOS/imenu.git")

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
    mkdir -p ${pkgdir}/usr/bin
    chmod +x *.sh
    mv *.sh ${pkgdir}/usr/bin/imenu
}

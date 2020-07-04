# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=mpm
pkgname=$_pkgname
pkgver=9851542
pkgrel=1
pkgdesc="minecraft package manager"
url="https://github.com/paperbenni/mpm"
arch=('any')
license=('MIT')
depends=('bash')
makedepends=('git')
provides=(mpm)
conflicts=(mpm)
source=("$_pkgname::git+https://github.com/paperbenni/mpm.git")

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
    mv mpm.sh ${pkgdir}/usr/bin/mpm
}

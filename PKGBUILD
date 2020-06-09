# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instanttools
pkgname=$_pkgname
pkgver=2020041458757ebd9
pkgrel=1
pkgdesc="development tools for instantOS"
url="https://github.com/instantOS/instanttools"
arch=('any')
license=('MIT')
depends=('sh')
makedepends=('git')
provides=(instanttools)
conflicts=(instanttools)
source=("$_pkgname::git+https://github.com/instantOS/instantTOOLS.git")

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
    mkdir -p ${pkgdir}/usr/share/instanttools

    chmod 755 *.sh
    chmod 755 utils/*.sh

    mv ibuild.sh ${pkgdir}/usr/bin/ibuild
    mv utils/* ${pkgdir}/usr/share/instanttools/

}

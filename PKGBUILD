# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantconf
pkgname=$_pkgname
pkgver=202004291748
pkgrel=1
pkgdesc="simple config system for instantOS"
url="https://github.com/instantOS/instantconf"
arch=('any')
license=('MIT')
depends=('sqlite' 'bash')
makedepends=('git')
provides=(instantconf)
conflicts=(instantconf)
source=("$_pkgname::git+https://github.com/instantOS/instantconf.git")

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
    chmod +x instantconf
    mv instantconf ${pkgdir}/usr/bin/instantconf
    ln -s /usr/bin/instantconf ${pkgdir}/usr/bin/iconf
}

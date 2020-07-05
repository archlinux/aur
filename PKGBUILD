# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=paperbash
pkgname=$_pkgname
pkgver=d400d26
pkgrel=1
pkgdesc="it's like pip but bash and a little shitty"
url="https://github.com/paperbenni/bash"
arch=('any')
license=('MIT')
depends=('sh' 'bash')
makedepends=('git' 'curl')
provides=(paperbash)
conflicts=(paperbash)
source=("$_pkgname::git+https://github.com/paperbenni/bash.git")

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
    mkdir -p ${pkgdir}/usr/share/paperbash
    chmod +x *.sh
    mv ./* ${pkgdir}/usr/share/paperbash/
}

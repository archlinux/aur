# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantsupport
pkgname=$_pkgname
pkgver=9851542
pkgrel=1
pkgdesc="remote support session"
url="https://github.com/instantOS/instantSUPPORT"
arch=('any')
license=('MIT')
depends=('bash' 'autossh' 'tmux')
makedepends=('git')
provides=(instantsupport)
conflicts=(instantsupport)
source=("$_pkgname::git+https://github.com/instantOS/instantSUPPORT.git")

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
    mv instantsupport.sh ${pkgdir}/usr/bin/instantsupport
}

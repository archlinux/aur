# Maintainer: Gabriel Jülke <pyriand3r at gmail dot com>

_pkgname=nuvola-app-youtube-git
pkgname=${_pkgname}
pkgver=1.0.0.5dbf0b5
pkgrel=1
pkgdesc="Integration of YouTube into your linux desktop via Nuvola Player."
arch=('any')
url="https://github.com/tiliado/nuvola-app-youtube"
license=('2-Clause BSD-license')
depends=(
    'nuvolaplayer-git'
)
makedepends=('git')
provides=(${_pkgname})
conflicts=(${_pkgname})
options=(!emptydirs)
source=("${_pkgname}::git+https://github.com/tiliado/nuvola-app-youtube.git")
md5sums=('SKIP')

pkgver() {
    echo ${pkgver}
}

package() {
    cd "${srcdir}/${_pkgname}"
    make build
    make install
}

# vim:set ts=4 sw=4 et:

# Maintainer icasdri <icasdri at gmail dot com>

_pkgname=visd
pkgname=visd-git
pkgver=9
pkgrel=1
pkgdesc="Use vim and ex mode as a stream editor"
arch=(any)
url="https://github.com/icasdri/visd"
license=('MIT')
depends=('vim')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 visd "${pkgdir}/usr/bin/visd"
}

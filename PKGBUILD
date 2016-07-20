# Maintainer icasdri <icasdri at gmail dot com>

_pkgname=visd
pkgname=visd-git
pkgver=7
pkgrel=2
pkgdesc="Use vim and ex mode as a stream editor"
arch=(any)
url="https://github.com/icasdri/visd"
license=('MIT')
depends=('vim')
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

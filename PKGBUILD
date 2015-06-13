# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=fakepkg
pkgver=1.0.1
pkgrel=1
pkgdesc="A tool to reassemble installed packages from its deliverd files. It comes in handy if there is no internet connection available and you have no access to an up-to-date package cache."
arch=('any')
license=('GPL2')
url="https://github.com/Edenhofer/bin"
depends=('bash>=4.2' 'pacman' 'tar' 'gzip')
source=("https://raw.githubusercontent.com/Edenhofer/bin/master/fakepkg")
md5sums=('SKIP')

package() {
    cd "${srcdir}"

    install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

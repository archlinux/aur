# Maintainer: Dimitrije Randjelovic <m1z23r@gmail.com>
pkgname=nikode-bin
pkgver=4.3.2
pkgrel=1
pkgdesc="A modern API client for developers"
arch=('x86_64')
url="https://github.com/m1z23r/nikode"
license=('GPL-3.0-or-later')
depends=('electron' 'gtk3' 'nss')
provides=('nikode')
conflicts=('nikode')
options=(!strip)
source=("${pkgname}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/Nikode-${pkgver}.pacman")
sha256sums=('SKIP')

package() {
    tar -xf "${srcdir}/${pkgname}-${pkgver}.pacman" -C "${pkgdir}" --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.MTREE' --exclude='.BUILDINFO'
    chmod -R g-w "${pkgdir}"
}

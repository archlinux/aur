# Maintainer: Ashley Bone <aur DOT ashley DOT bone AT gmail DOT com>
pkgname='organizr'
_pkgname='Organizr'
pkgver=1.22
pkgrel=1
pkgdesc='HTPC/HomeLab services organizer.'
arch=('any')
url='https://github.com/causefx/Organizr'
license=('GPL3')
depends=('php-sqlite')
optdepends=('fail2ban')
install='organizr.install'
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/causefx/Organizr/archive/${pkgver}.tar.gz" "organizr.install")
sha256sums=('0985688d2829a426a7827912ae38733e7f0d856f4ae0b440b4022a1b4ee0d667'
            '75a1a4663fe4d628d88f3ce5f9c9e95761d3f6cfdc753f04d4b9d0e9c57c1735')

package() {
    install -dm 755 "${pkgdir}/usr/share/webapps/${pkgname}/${_pkgname}"
    install -dm 755 "${pkgdir}/var/lib/${pkgname}"
    cp -r "${srcdir}/${_pkgname}-${pkgver}/"* "${pkgdir}/usr/share/webapps/${pkgname}/${_pkgname}"
}

# Maintainer: Ashley Bone <aur DOT ashley DOT bone AT gmail DOT com>
pkgname='organizr'
_pkgname='Organizr'
pkgver=1.32
pkgrel=4
_pkgver=1.323
pkgdesc='HTPC/HomeLab services organizer.'
arch=('any')
url='https://github.com/causefx/Organizr'
license=('GPL3')
depends=('php-sqlite')
optdepends=('fail2ban')
install='organizr.install'
source=("${_pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/causefx/Organizr/archive/${_pkgver}.tar.gz" "organizr.install")
sha256sums=('760ef5914f60bf27b662b40e6734809262904401e061a1d7754893cb6ef6acf1'
	    'c4f08e6f1569ea9d82ae14bd5ec6cd5c0a8d762b52c7331bd75024092efaa390')

package() {
    install -dm 755 "${pkgdir}/usr/share/webapps/${pkgname}/${_pkgname}"
    install -dm 755 "${pkgdir}/var/lib/${pkgname}"
    cp -r "${srcdir}/${_pkgname}-${_pkgver}/"* "${pkgdir}/usr/share/webapps/${pkgname}/${_pkgname}"
}

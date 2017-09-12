# Maintainer: Ashley Bone <aur DOT ashley DOT bone AT gmail DOT com>
pkgname='organizr'
_pkgname='Organizr'
pkgver=1.44
pkgrel=1
_pkgver=1.44
pkgdesc='HTPC/HomeLab services organizer.'
arch=('any')
url='https://github.com/causefx/Organizr'
license=('GPL3')
depends=('php-sqlite')
optdepends=('fail2ban')
install='organizr.install'
source=("${_pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/causefx/Organizr/archive/${_pkgver}.tar.gz" "organizr.install")
sha256sums=('bde7d9420663d329fb592d7fada09467aec593ceb9acc11911cbb7d98e460754'
	    'c4f08e6f1569ea9d82ae14bd5ec6cd5c0a8d762b52c7331bd75024092efaa390')

package() {
    install -dm 755 "${pkgdir}/usr/share/webapps/${pkgname}/${_pkgname}"
    install -dm 755 "${pkgdir}/var/lib/${pkgname}"
    cp -r "${srcdir}/${_pkgname}-${_pkgver}/"* "${pkgdir}/usr/share/webapps/${pkgname}/${_pkgname}"
}

# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=roundcubemail-skin-classic
_skinname=classic
pkgver=1.6.0
pkgrel=1
pkgdesc='Classic skin for Roundcube Webmail'
arch=('any')
url='https://github.com/roundcube/classic'
license=('CCPL')
depends=('roundcubemail')
source=("https://github.com/roundcube/${_skinname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8b9d27b4b6ca469c7246985f9bca9e9711a57c825f9c25c6b082273a3920e4c3')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/skins"
    cp -r "${srcdir}/${_skinname}-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/skins/${_skinname}"
}

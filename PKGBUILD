# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=roundcubemail-skin-larry
_skinname=larry
pkgver=1.6.0
pkgrel=1
pkgdesc='Larry skin for Roundcube Webmail'
arch=('any')
url='https://github.com/roundcube/larry'
license=('CCPL')
depends=('roundcubemail')
source=("https://github.com/roundcube/${_skinname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7494d9130286669fc486903b7068152fdfdbe8e0ccdb324fba85299f58f9fb4e')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/skins"
    cp -r "${srcdir}/${_skinname}-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/skins/${_skinname}"
}

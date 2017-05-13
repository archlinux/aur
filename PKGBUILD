# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='mdm-themes-html'
_pkgname='mint-mdm-themes-html'
pkgver='2.0.14'
pkgrel='1'
pkgdesc='HTML themes for the MDM Display Manager'
arch=('any')
url='http://packages.linuxmint.com'
license=('GPL3')
depends=('mdm-display-manager')
source=("${url}/pool/main/m/${_pkgname}/${_pkgname}_${pkgver}.tar.xz")
sha256sums=('85c7fea502b02253c4e4202c2eb545b6913b6f53a0ba2176301ba1a362449377')

# Copying the full html-themes file to /usr/share/mdm folder
# Since it requires mdm, it will add it to that directory
package() {
  cp -r ${srcdir}/${_pkgname}/usr ${pkgdir}/usr
}



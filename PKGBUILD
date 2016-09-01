# Maintainer: Sam Burgos < jsbm1089 at gmail dot com >

pkgname='mdm-themes-html'
_pkgname='mint-mdm-themes-html'
pkgver='2.0.10'
pkgrel='3'
pkgdesc='HTML themes for the MDM Display Manager'
arch=('any')
url='http://packages.linuxmint.com'
license=('GPL3')
depends=('mdm-display-manager')
source=("${url}/pool/main/m/${_pkgname}/${_pkgname}_${pkgver}.tar.xz")
sha256sums=('b1c704e40f980e1a213130a78bec743d723eae4076787c7a909efccdc020e77c')

# Copying the full html-themes file to /usr/share/mdm folder
# Since it requires mdm, it will add it to that directory
package() {
  cp -r ${srcdir}/${_pkgname}/usr ${pkgdir}/usr
}



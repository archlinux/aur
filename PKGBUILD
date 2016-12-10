# Maintainer: Sam Burgos < jsbm1089 at gmail dot com >

pkgname='mdm-themes-html'
_pkgname='mint-mdm-themes-html'
pkgver='2.0.13'
pkgrel='1'
pkgdesc='HTML themes for the MDM Display Manager'
arch=('any')
url='http://packages.linuxmint.com'
license=('GPL3')
depends=('mdm-display-manager')
source=("${url}/pool/main/m/${_pkgname}/${_pkgname}_${pkgver}.tar.xz")
sha256sums=('21045c22272763d5ce5b97aa02dc5edc73ebc5b5c0da70cba93ecbc020fd788d')

# Copying the full html-themes file to /usr/share/mdm folder
# Since it requires mdm, it will add it to that directory
package() {
  cp -r ${srcdir}/${_pkgname}/usr ${pkgdir}/usr
}



# $Id$
# Contributor: fila pruda.com

pkgname=roundcube-sieverules-plugin
pkgver=2.3
pkgrel=1
pkgdesc="This plugin adds the ability for users to manage their sieve mail filter rules."
arch=('any')
url="https://github.com/JohnDoh/Roundcube-Plugin-SieveRules-Managesieve/"
license=('GPL')
depends=('roundcubemail>=1.0')
source=(https://github.com/JohnDoh/Roundcube-Plugin-SieveRules-Managesieve/archive/${pkgver}.tar.gz)
#source=(https://github.com/JohnDoh/Roundcube-Plugin-SieveRules-Managesieve/archive/master.tar.gz)
md5sums=('560e681513df304dd11181e58d4f0aa5')

package() {
  _instdir=${pkgdir}/usr/share/webapps/roundcubemail/plugins
  install -dm755 ${_instdir}
  cp -r ${srcdir}/Roundcube-Plugin-SieveRules-Managesieve-${pkgver} ${_instdir}/sieverules
  #cp -r ${srcdir}/Roundcube-Plugin-SieveRules-Managesieve-master ${_instdir}/sieverules
}

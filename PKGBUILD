# Maintainer: Filip <fila pruda com>

pkgname=roundcube-plugin-sieverules
pkgver=2.3
#pkgver=master
pkgrel=1
pkgdesc="Roundcube plugin that allows users to manage sieve filter rules."
arch=('any')
url="https://github.com/JohnDoh/Roundcube-Plugin-SieveRules-Managesieve/"
license=('GPL')
depends=('roundcubemail>=1.1.0')
source=("https://github.com/JohnDoh/Roundcube-Plugin-SieveRules-Managesieve/archive/$pkgver.tar.gz")
md5sums=('560e681513df304dd11181e58d4f0aa5')

package() {
  
  _instdir="$pkgdir/usr/share/webapps/roundcubemail/plugins"
  install -dm755 "$_instdir"
  cp -r "Roundcube-Plugin-SieveRules-Managesieve-$pkgver" "$_instdir/sieverules"
}

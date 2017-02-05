# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=metacity-themes
pkgver=3.18.11
pkgrel=1
pkgdesc="The standard Metacity themes"
arch=('any')
url="https://github.com/charlesbos/metacity-themes"
license=('GPL2')
conflicts=('gnome-themes-standard<3.16.0' 'metacity<3.20.0')
source=("https://github.com/charlesbos/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('117f0a5790ae581d67d5903416d9355383d21712aa1bce03d52daab1ae195ac5')

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  themes=('Adwaita' 'AgingGorilla' 'Atlanta' 'Bright' 'Clearlooks' 'ClearlooksClassic'
          'Crux' 'Esco' 'Glider' 'Glossy' 'Gorilla' 'HighContrast' 'Inverted' 'Metabox' 
          'Mist' 'Simple' 'Unity')
  for x in "${themes[@]}"; do
    cp -r "${srcdir}/${pkgname}-${pkgver}/${x}" "${pkgdir}/usr/share/themes"
  done
}

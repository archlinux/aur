# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=metacity-themes
pkgver=3.18.12
pkgrel=1
pkgdesc="Themes for the Metacity window manager"
arch=('any')
url="https://github.com/charlesbos/metacity-themes"
license=('GPL2')
conflicts=('gnome-themes-standard<3.16.0' 'metacity<3.20.0')
source=("https://github.com/charlesbos/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('233ac1a77f1637ca8408689f1a2dccaca41d5dfee0ee1c3c71763dcdf25a6221')

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  themes=('Adwaita' 'AgingGorilla' 'Alloy' 'Atlanta' 'Bright' 'BrushedMetal' 
          'Clearlooks' 'ClearlooksClassic' 'Crux' 'Esco' 'Glider' 'Glossy' 
          'Gorilla' 'HeliX-Sweetpill-Crowberry' 'HighContrast' 'Inverted' 
          'keramik-Gyellow' 'mcblue' 'Metabox' 'Mist' 'Nodoka' 'OutlineAsh' 
          'OutlineBeach' 'OutlineCoal' 'OutlineCold' 'OutlineFruity' 
          'OutlineHot' 'OutlineWinter' 'quiet-purple' 'Redmond' 'Simple' 'Unity' 
          'Urbicande' 'Watercolor')
  for x in "${themes[@]}"; do
    cp -r "${srcdir}/${pkgname}-${pkgver}/${x}" "${pkgdir}/usr/share/themes"
  done
}

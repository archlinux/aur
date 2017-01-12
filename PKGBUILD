# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=metacity-themes
pkgver=3.18.5.1
pkgrel=1
pkgdesc="The standard Metacity themes"
arch=('any')
url="https://github.com/charlesbos/metacity-themes"
license=('GPL2')
conflicts=('gnome-themes-standard<3.16.0' 'metacity<3.20.0')
source=("https://github.com/charlesbos/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('786cd1e01115dcf3ee278fdc4b5c3f988763a06a795ed08ccf765eef66fbc4e9')

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  themes=('Adwaita' 'AgingGorilla' 'Atlanta' 'Bright' 'Crux' 'Esco' 'HighContrast' 'Metabox' 'Simple')
  for x in "${themes[@]}"; do
    cp -r "${srcdir}/${pkgname}-${pkgver}/${x}" "${pkgdir}/usr/share/themes"
  done
}

# Maintainer: ThePilot <afuturepilotis at gmail dot com>
pkgname='ambiance-radiance-flat-colors-suite'
pkgver='16.04.1'
pkgrel=2
pkgdesc="A Modern, Beautiful and Vivid Re-imagination of the Ambiance & Radiance Color GTK 2/3 Themes."
arch=('any')
license=('GPL2')
options=('!strip' '!zipman')
url="http://www.ravefinity.com/p/download-ambiance-radiance-flat-colors.html"
depends=('gtk-engine-murrine')
optdepends=('vibrancy-colors' 'gtk3>=3.14' 'gtk3<3.20')
source=("$pkgname-$pkgver::https://drive.google.com/uc?export=download&id=0B7iDWdwgu9QATV96bTVUSktlXzQ")
md5sums=('ae8a4c0212f3b186ba190406bc2bdb3a')

package() {
  install -d "$pkgdir"/usr/share/themes
  cp -r Ambiance-* Radiance-* "$pkgdir"/usr/share/themes
}

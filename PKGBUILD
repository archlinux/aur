# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=simona-kde-color-scheme-custom
pkgver=0.0.1
pkgrel=1
pkgdesc="Custom pink theme for KDE Plasma 5.0 GUI"

arch=('any')
license=('GPL3')

depends=('plasma-desktop>=5.12')
#optdepends=('' '')

#source=($pkgname-$pkgver.tar.gz)
source=("simona-kde-color-scheme-custom.colors") #file locale incapsulato localmente

md5sums=('8a0135d1a5b8a6029ed357604a473009')

package() {
  cd "$srcdir"
  install -Dm600 "$srcdir/simona-kde-color-scheme-custom.colors" "$HOME/.kde/share/apps/color-schemes/simona-kde-color-scheme-custom.colors"
}













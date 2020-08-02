# Maintainer: Bartosz Chmura <chmurli@gmail.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Yegorius <yegorius@domic.us>

pkgname=ttf-aller
pkgver=1.0
pkgrel=6
pkgdesc="An excellent sans serif font for screen legibility"
arch=('any')
url="http://www.daltonmaag.com/"
license=(custom)
provides=('ttf-font')
depends=()
conflicts=()
source=('aller.zip::http://dl.1001fonts.com/aller.zip')
sha256sums=('414d2288b9ad72aa0eba9b65b1e949e4f1b0fc655912ae16e4fb2103d83d04cc')


package() {
  mkdir -p "$pkgdir"/usr/share/fonts/TTF
  install -m644 "$srcdir"/*.ttf "$pkgdir"/usr/share/fonts/TTF
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 "$srcdir"/*.pdf "$pkgdir"/usr/share/licenses/$pkgname
}


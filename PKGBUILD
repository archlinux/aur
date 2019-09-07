# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=ttf-amerika
pkgver=2
pkgrel=2
pkgdesc="Amerika and America Sans True Type Fonts by: Apostrophic"
arch=('any')
license=('custom')
url="https://www.1001fonts.com/amerika-font.html"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("https://dl.1001fonts.com/amerika.zip")

md5sums=('912f11e840ec0e8a2222b0406a627d9e')

package() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  install -Dm644 readme.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

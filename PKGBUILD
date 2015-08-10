# Maintainer: Max Gonzih <gonzih at gmail dot com>
pkgname=iosevka-font
pkgver=0.0.17
pkgrel=1
pkgdesc="Iosevka programming font"
arch=('any')
url=('https://github.com/be5invis/Iosevka')
license=('OFL')
depends=(fontconfig xorg-font-utils)
install=$pkgname.install
source=("https://github.com/be5invis/Iosevka/archive/v$pkgver.tar.gz")
md5sums=('a8d29d3b5669cd7848447a9907199202')

package() {
  cd $srcdir/
  mkdir -p $pkgdir/usr/share/fonts/TTF/
  find . -iname "*.ttf" -execdir install -Dm644 {} $pkgdir/usr/share/fonts/TTF/{} \;
}

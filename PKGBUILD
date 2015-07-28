# Maintainer: Max Gonzih <gonzih at gmail dot com>
pkgname=iosevka-font
pkgver=0.0.5
pkgrel=1
pkgdesc="Iosevka programming font"
arch=('any')
url=('https://github.com/be5invis/Iosevka')
license=('SIL')
depends=(fontconfig xorg-font-utils)
install=$pkgname.install
source=("https://github.com/be5invis/Iosevka/archive/v$pkgver.tar.gz")
md5sums=('e5e3e76dab4a669179a755fd01c60fb4')

package() {
  cd $srcdir/
  mkdir -p $pkgdir/usr/share/fonts/TTF/
  find . -iname "*.ttf" -execdir install -Dm644 {} $pkgdir/usr/share/fonts/TTF/{} \;
}

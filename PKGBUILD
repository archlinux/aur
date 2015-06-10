# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=ttf-roboto-slab
pkgver=1.100262
pkgrel=3
pkgdesc='Serif Roboto font from Google Keep'
arch=('any')
license=('APACHE')
url='https://www.google.com/fonts/specimen/Roboto+Slab'
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=('https://gavinhungry.io/pub/Roboto_Slab.zip')
md5sums=('1222eadc0fece6cded684fcff6ec230b')
install=$pkgname.install

package() {
  install -d $pkgdir/usr/share/licenses/$pkgname/
  install -m644 $srcdir/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/
	install -d $pkgdir/usr/share/fonts/TTF/
	install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/
}


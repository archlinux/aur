# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=kbd-ru-keymaps
pkgver=1
pkgrel=5
pkgdesc="Russian kbd keymaps for utf8 locale"
arch=(any)
url="http://wiki.archlinux.org/index.php/%D0%98%D0%BD%D1%82%D0%B5%D1%80%D0%BD%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F"
license=('GPL')
depends=('kbd')
install=kbd-ru-keymaps.install
source=(ru-utf.map.gz
	ru-utf-menu-swapcaps.map.gz)
md5sums=('574e4a93834e4f2a66fe001c09a2113a'
	 '44bbe91ced610644ba3c13d529d1718c')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/usr/share/kbd/keymaps/i386/qwerty
  cp *.map "$pkgdir"/usr/share/kbd/keymaps/i386/qwerty/
  gzip "$pkgdir"/usr/share/kbd/keymaps/i386/qwerty/*.map
}

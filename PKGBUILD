# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=ttf-antipasto
_pkgname=antipasto
pkgver=3
pkgrel=1
pkgdesc="Antipasto is a soft round font and really smart created by Cosimo Lorenzo Pancini. An Arista font collection by Zetafonts."
arch=('any')
license=('custom:free')
url="http://www.zetafonts.com/collection/104/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://www.fontsy.com/fonts/file/11552_${_pkgname}.zip")

md5sums=('e62359a6a7288e925851a1d6d27ad6ff')

package() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  install -Dm644 README_* $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

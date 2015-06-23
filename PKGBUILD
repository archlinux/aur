# Maintainer: John Jenkins twodopeshaggy@gmail.com
# Contributor: stlarch  stlarchie@gmail.com

pkgname=ohsnap
pkgver=1.8.0
pkgrel=1
pkgdesc="Monospaced font based on Artwiz Snap."
arch=('any')
url="http://sourceforge.net/projects/osnapfont"
license=('GPLv2')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ohsnap.install
source=("http://sourceforge.net/projects/osnapfont/files/$pkgname-$pkgver.tar.gz")

package () {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/fonts/local"
  install -d "$pkgdir/usr/share/kbd/consolefonts"
  install -d "$pkgdir/usr/share/doc/$pkgname"

  install -m644 *.pcf "$pkgdir/usr/share/fonts/local"
  install -m644 *.psfu "$pkgdir/usr/share/kbd/consolefonts"
  install -m644 README.ohsnap "$pkgdir/usr/share/doc/$pkgname"
}
md5sums=('aeb3d8e1f9634900036f886a14b3b03a')

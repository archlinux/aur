_pkgname=termsyn
pkgname=termsyn-font
pkgver=1.8.7
pkgrel=2
pkgdesc="Monospaced font based on terminus and tamsyn"
arch=('any')
url="http://sourceforge.net/projects/termsyn/"
license=('GPL-2')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontscale')
install=termsyn-font.install
source=("http://downloads.sourceforge.net/project/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('e870a0952bc1c5137a216e03095fe2db')

package () {
  cd "$srcdir/$_pkgname-$pkgver"

  install -d "$pkgdir/usr/share/fonts/$_pkgname"
  install -m644 *.pcf "$pkgdir/usr/share/fonts/$_pkgname/"
  install -m644 *.psfu "$pkgdir/usr/share/fonts/$_pkgname/"
}

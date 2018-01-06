# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# contributor: marcus fritzsch <m@fritschy.de>

pkgname=gnuhtml2latex
pkgver=0.4
pkgrel=3
pkgdesc="A Perl script that converts html files to latex"
arch=('any')
url="http://packages.debian.org/unstable/text/gnuhtml2latex"
license=('GPL')
depends=('perl-html-parser')
source=(http://ftp.debian.org/debian/pool/main/g/gnuhtml2latex/gnuhtml2latex_${pkgver}.orig.tar.gz)
md5sums=('6708dc9ab5b0d31572f27420d2992258')

package() {
  cd "$srcdir"/gnuhtml2latex
  mkdir -p "$pkgdir"/usr/bin/ "$pkgdir"/usr/share/man/man1
  install -m 755 gnuhtml2latex "$pkgdir"/usr/bin/
  pod2man "$pkgdir"/usr/bin/gnuhtml2latex "$pkgdir"/usr/share/man/man1/gnuhtml2latex.1
}

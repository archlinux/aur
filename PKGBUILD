# Maintainer: csllbr
pkgname=ansi2html
pkgver='0.23'
pkgrel=15
pkgdesc="Convert ANSI (terminal) colours and attributes to HTML"
arch=('any')
url="http://www.pixelbeat.org/docs/terminal_colours/"
author='Pádraig Brady'
license=('GPL')
depends=('sh')
source=('https://raw.github.com/pixelb/scripts/master/scripts/ansi2html.sh')


package() {
    install -D $srcdir/ansi2html.sh $pkgdir/usr/bin/ansi2html
}

sha256sums=('395be13d03adfccf30b8288555b91af0b2345925ed70b7a1eecca0fa72a9f538')

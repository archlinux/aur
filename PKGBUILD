# Maintainer: csllbr 
pkgname=ansi2html
pkgver='0.16'
pkgrel=10
pkgdesc="Convert ANSI (terminal) colours and attributes to HTML"
arch=('any')
url="http://www.pixelbeat.org/docs/terminal_colours/"
author='PÃ¡draig Brady'
license=('GPL')
depends=('sh')
source=('https://raw.github.com/pixelb/scripts/master/scripts/ansi2html.sh')


package() {
    install -D $srcdir/ansi2html.sh $pkgdir/usr/bin/ansi2html
}

md5sums=('2131e5d2baaa8a02d43dd7bbe667be1e')

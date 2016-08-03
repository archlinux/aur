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

sha256sums=('22d335db3492eaf3b9fa537ab93ba1ce2a24dbaed14c7600c90738f71fe13051')

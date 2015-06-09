# Contributor: Christian Sillaber christian.sillaber[at]uibk.ac.at 
pkgname=ansi2html
pkgver='0.15'
pkgrel=9
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

md5sums=('30c323938552b6d9360713617f0a0aba')

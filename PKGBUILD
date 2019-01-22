# Maintainer:  Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Kyle Terrien <kyleterrien at gmail dot com>
# Contributor: tigrmesh <tigrmesh at aol dot com>
# Contributor: lang2 <wenzhi.liang@gmail.com>

pkgname=tkdiff
pkgver=4.3.5
pkgrel=1
arch=('any')
license=('GPL')
pkgdesc="a graphical front end to the diff program"
url="http://tkdiff.sourceforge.net/"
depends=('tcl' 'tk')
conflicts=('tkcvs')
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-4-3-5.zip)
md5sums=('1a8619f33ef95792b28787fb54dfab30')

package() { 
	install -Dm755 "$srcdir/$pkgname-4-3-5/tkdiff" "$pkgdir/usr/bin/tkdiff"; 
} 

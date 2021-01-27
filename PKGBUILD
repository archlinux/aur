# Maintainer:  Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Kyle Terrien <kyleterrien at gmail dot com>
# Contributor: tigrmesh <tigrmesh at aol dot com>
# Contributor: lang2 <wenzhi.liang@gmail.com>

pkgname=tkdiff
pkgver=5.1
pkgrel=1
arch=('any')
license=('GPL')
pkgdesc="a graphical front end to the diff program"
url="http://tkdiff.sourceforge.net/"
depends=('tcl' 'tk')
conflicts=('tkcvs')
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-5-1.zip)
md5sums=('3c08e7985080e310c51ab29181df1856')

package() { 
	install -Dm755 "$srcdir/$pkgname-5-0/tkdiff" "$pkgdir/usr/bin/tkdiff"; 
} 

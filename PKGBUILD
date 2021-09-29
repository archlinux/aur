# Maintainer:  Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Kyle Terrien <kyleterrien at gmail dot com>
# Contributor: tigrmesh <tigrmesh at aol dot com>
# Contributor: lang2 <wenzhi.liang@gmail.com>

pkgname=tkdiff
pkgver=5.2.1
pkgrel=1
arch=('any')
license=('GPL')
pkgdesc="a graphical front end to the diff program"
url="http://tkdiff.sourceforge.net/"
depends=('tcl' 'tk')
conflicts=('tkcvs')
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-5-2-1.zip)
md5sums=('fc7070737eb2ebacefae92c5b514608e')

package() { 
	install -Dm755 "$srcdir/$pkgname-5-2-1/tkdiff" "$pkgdir/usr/bin/tkdiff"; 
} 

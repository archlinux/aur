# Maintainer:  Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Kyle Terrien <kyleterrien at gmail dot com>
# Contributor: tigrmesh <tigrmesh at aol dot com>
# Contributor: lang2 <wenzhi.liang@gmail.com>

pkgname=tkdiff
pkgver=5.7
pkgrel=1
arch=('any')
license=('GPL')
pkgdesc="a graphical front end to the diff program"
url="http://tkdiff.sourceforge.net/"
depends=('tcl' 'tk')
conflicts=('tkcvs')
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-5-7.zip)
sha256sums=('e2dec98e4c2f7c79a1e31290d3deaaa5915f53c8220c05728f282336bb2e405d')

package() { 
	install -Dm755 "$srcdir/$pkgname-5-7/tkdiff" "$pkgdir/usr/bin/tkdiff"; 
} 

# Maintainer:  Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Kyle Terrien <kyleterrien at gmail dot com>
# Contributor: tigrmesh <tigrmesh at aol dot com>
# Contributor: lang2 <wenzhi.liang@gmail.com>

pkgname=tkdiff
pkgver=6.0
pkgrel=1
arch=('any')
license=('GPL')
pkgdesc="a graphical front end to the diff program"
url="http://tkdiff.sourceforge.net/"
depends=('tcl' 'tk')
conflicts=('tkcvs')
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-6-0.zip)
sha256sums=('4fa27c87846c1d6635da5beaa90ce4561638ee25a9169e455175afcf5288e453')

package() { 
	install -Dm755 "$srcdir/$pkgname-6-0/tkdiff" "$pkgdir/usr/bin/tkdiff"; 
} 

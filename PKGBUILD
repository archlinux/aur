# Maintainer: Kyle Terrien <kyleterrien at gmail dot com>
# Contributor: tigrmesh <tigrmesh at aol dot com>
# Contributor: lang2 <wenzhi.liang@gmail.com>

pkgname=tkdiff
pkgver=4.2
pkgrel=1
arch=('any')
license=('GPL')
pkgdesc="a graphical front end to the diff program"
url="http://tkdiff.sourceforge.net/"
depends=('tk')
conflicts=('tkcvs')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('734bb417184c10072eb64e8d274245338e41b7fdeff661b5ef30e89f3e3aa357')

package() { 
	install -Dm755 "$srcdir/$pkgname-unix/tkdiff" "$pkgdir/usr/bin/tkdiff"; 
} 

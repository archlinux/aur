# Maintainer: robertfoster

pkgname=bootinfoscript
pkgver=0.76
pkgrel=1
pkgdesc="A script which searches all hard drives attached to the computer for information related to booting."
arch=('i686' 'x86_64')
url="https://github.com/arvidjaar/bootinfoscript"
license=('MIT')
depends=('bash')
source=("https://github.com/arvidjaar/bootinfoscript/archive/v$pkgver.tar.gz")

package() {
	cd $srcdir/$pkgname-$pkgver
	install -D -m644 bootinfoscript  $pkgdir/usr/bin/bootinfoscript
	chmod +x $pkgdir/usr/bin/bootinfoscript
}

md5sums=('fdf5a747d59590406d0ef5d87cc02e8b')

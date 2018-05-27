# Maintainer: E5ten

pkgname=simple-package-manager
_pkgname=spm
pkgver=0.2.05
pkgrel=1
pkgdesc="A simple commandline package manager for AppImages written in bash"
arch=('any')
url='http://www.simonizor.net'
license=('GPL2')
depends=('bash' 'jq')
conflicts=('spm')
source=("https://github.com/simoniz0r/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('dc5a2aa999d6eae04dc20baad0d5c2c1')

package() {
	cd $srcdir/$_pkgname-$pkgver
	mkdir -p $pkgdir/usr/bin
	mv spm $pkgdir/usr/bin
}

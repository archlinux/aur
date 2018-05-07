# Maintainer: E5ten

pkgname=simple-package-manager
_pkgname=spm
pkgver=0.2.03
pkgrel=2
pkgdesc="A simple commandline package manager for AppImages written in bash"
arch=('any')
url='http://www.simonizor.net'
license=('GPL2')
depends=('bash' 'jq')
conflicts=('spm')
source=("https://github.com/simoniz0r/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('113e992b55500aadca2f149c78a51712')

package() {
	cd $srcdir/$_pkgname-$pkgver
	mkdir -p $pkgdir/usr/bin
	mv spm $pkgdir/usr/bin
}
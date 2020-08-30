# Maintainer: Ilya Elenskiy 

pkgname=paup-cli
pkgver=4.0a168
_execname=paup${pkgver//.0/}_ubuntu64
pkgrel=1
pkgdesc="Phylogenetic Analysis Using PAUP"
arch=('i686' 'x86_64')
url="http://phylosolutions.com/paup-test/"
license=('custom')
depends=('python2' 'gcc-fortran')
source=("http://phylosolutions.com/paup-test/$_execname.gz")
md5sums=('a4a4f378cd5f8656664956180649d589')

package() {
	install -Dm755 "$srcdir/$_execname" "$pkgdir/usr/bin/paup"
}

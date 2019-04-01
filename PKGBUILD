# Maintainer: diesys <code@flowin.space>
pkgname=iblu
pkgver=0.9
pkgrel=1
pkgdesc="Intel Black Light Utility, written in python, allows you to control the screen brightness (iX processors family), via command line interface."
arch=('any')
url="https://git.eigenlab.org/sbiego/iblu"
license=('GPLv3')
depends=('python')
provides=($pkgname)
install=$pkgname.install
source=(https://git.eigenlab.org/sbiego/iblu/-/archive/v$pkgver/iblu-v$pkgver.tar.gz)
sha256sums=('604aec80a03d72c34b5ca807fd2715fedbe73651010d489f43a4c5881ff87d52')

package() {
    ## copia file
	cd "$srcdir/$pkgname"
    install -D $pkgname.py $pkgdir/usr/bin/$pkgname
}

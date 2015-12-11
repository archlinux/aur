# Maintainer:  respiranto <respiranto@icloud.com>
pkgname=dict-freedict-spa-eng
pkgver=0.2
pkgrel=6
pkgdesc="Spanish -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("http://sourceforge.net/projects/freedict/files/Spanish%20-%20English/$pkgver/freedict-spa-eng-$pkgver.tar.bz2")
md5sums=('9611215259c816cfb25d30c5becf8c96')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp spa-eng/spa-eng.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}

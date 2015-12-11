# Maintainer:  respiranto <respiranto@icloud.com>
pkgname=dict-freedict-deu-fra
pkgver=0.3.1
pkgrel=6
pkgdesc="German -> French dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("http://sourceforge.net/projects/freedict/files/German%20-%20French/$pkgver/freedict-deu-fra-$pkgver.tar.bz2")
md5sums=('8abb6c86f11cad57c9dcec619e2f2ca3')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp deu-fra/deu-fra.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}

# Maintainer:  respiranto <respiranto@icloud.com>
pkgname=dict-freedict-eng-spa
pkgver=0.2.1
pkgrel=6
pkgdesc="English -> Spanish dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("http://sourceforge.net/projects/freedict/files/English%20-%20Spanish/$pkgver/freedict-eng-spa-$pkgver.tar.bz2")
md5sums=('89abca9ccba27f3a34c7363a510b91a1')

package()
{
	mkdir -p "$pkgdir/usr/share/dictd"
	cp eng-spa/eng-spa.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}

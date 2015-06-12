# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=zoneclient
pkgver=0.64
pkgrel=1
pkgdesc="simple Python script to register your dynamic IP address with zoneedit's dynamic IP DNS service"
arch=('any')
url="http://zoneclient.sourceforge.net/"
depends=('python2')
license=('gpl2')
source=("http://zoneclient.sourceforge.net/zoneclient.py")
md5sums=('0b6844e7726a30d2f7dceaa9cb124f64')

build() {
sed -is '1s/python/python2/' $srcdir/zoneclient.py
}

package() {
install -Dm755 $srcdir/zoneclient.py $pkgdir/usr/bin/zoneclient.py
}

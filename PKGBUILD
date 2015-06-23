# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs-nautilus
pkgver=0.16
pkgrel=1
pkgdesc="Nautilus front-end for RabbitVCS"
arch=('any')
url="http://rabbitvcs.org/"
install=$pkgname.install
depends=('nautilus>=3.0.0' 'python2-nautilus' 'python2-dbus' "rabbitvcs>=$pkgver")
license=('GPL')
source=("https://github.com/rabbitvcs/rabbitvcs/archive/v0.16.tar.gz")
md5sums=('25376cff136ad2fac901ff88e07893ef')

package(){
	install -D "$srcdir/rabbitvcs-$pkgver/clients/nautilus-3.0/RabbitVCS.py" "$pkgdir/usr/share/nautilus-python/extensions/RabbitVCS.py"
}

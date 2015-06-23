# Maintainer: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs-nemo
pkgdesc="Nemo front-end for rabbitvcs SVN GIT HG Extension."
pkgver=0.16
pkgrel=2
arch=('any')
url="http://rabbitvcs.org/"
install=$pkgname.install
depends=('nemo-python>=2.0' 'python2-dbus' "rabbitvcs>=$pkgver")
license=('GPL')
source=("https://github.com/rabbitvcs/rabbitvcs/archive/v0.16.tar.gz")
md5sums=('25376cff136ad2fac901ff88e07893ef')

package(){
	install -D "$srcdir/rabbitvcs-$pkgver/clients/nemo/RabbitVCS.py" "$pkgdir/usr/share/nemo-python/extensions/RabbitVCS.py"
}

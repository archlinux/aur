# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: Jeff Mickey <j@codemac.net>

pkgname=speedometer
_debianver=2.8-3    # Debian fork
pkgver=2.8
pkgrel=4
pkgdesc="Measure and display the rate of data across a network connection or data being stored in a file"
arch=('any')
url="http://excess.org/speedometer/"
license=('GPL')
#depends=('python-urwid')
depends=('python-psutil' 'python-six' 'python-urwid')    # Debian fork
makedepends=('python-setuptools')
#source=(http://excess.org/$pkgname/$pkgname-$pkgver.tar.gz)
source=(http://ftp.us.debian.org/debian/pool/main/s/speedometer/speedometer_${_debianver}_all.deb)    # Debian fork
md5sums=('5ce789533761ca016806fc940ce1fc63')
sha1sums=('cb64fd7b512e772e1f74ee8c71bfbe70a83308fb')

package() {
  #cd $pkgname-$pkgver
  #
  #python setup.py install --root="$pkgdir/" --optimize=1
  #
  #mv "$pkgdir/usr/bin/speedometer"{.py,}
  #rm -r "$pkgdir/usr/lib/"


  # Debian fork
  tar xf data.tar.xz
  install -Dm755 {,"$pkgdir/"}usr/bin/speedometer
  install -Dm644 {,"$pkgdir/"}usr/share/man/man1/speedometer.1.gz
}


# Maintainer: Adam Nielsen <malvineous@shikadi.net>
pkgname=pyopl
pkgver=1.2
pkgrel=1
pkgdesc="Python wrapper around DOSBox OPL synth"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/PyOPL"
license=('GPLv3')
depends=('python2')
source=(http://pypi.python.org/packages/source/P/PyOPL/PyOPL-$pkgver.tar.gz)
md5sums=('8304ea949b6dea14a4c05f371b8f4cf9')

build() {
  cd $srcdir/PyOPL-$pkgver
  python2 setup.py install --root=$pkgdir
  install -d $pkgdir/usr/share/licenses/$pkgname
  sed -n -e 20p README > $pkgdir/usr/share/licenses/$pkgname/COPYING
}

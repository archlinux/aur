# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>

pkgname=python-openopt
_pythonname=OpenOpt
pkgver=0.45
pkgrel=1
arch=('any')
url='http://www.openopt.org'
license=('BSD')
pkgdesc='Optimization library'
depends=('python' 'python-numpy')
conflicts=('python2-openopt')
source=("http://openopt.org/images/3/33/${_pythonname}.zip")

build() {
  cd "$srcdir/${_pythonname}"

  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -D -m 644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
}

md5sums=('214517cf319eb75a2515fe4f3bcc0684')
sha256sums=('3f777a523c593e259ca0211d90d403d890822a6ccb67557479f03b4c172a569d')

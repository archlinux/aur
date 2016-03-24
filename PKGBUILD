# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Linmiao Xu <linmiao.xu@gmail.com>
# Contributor: Tnoo <archtnoo at tnoo dot net>

pkgname=python2-openopt
_pythonname=openopt
pkgver=0.5625
pkgrel=1
arch=('any')
url='http://www.openopt.org'
license=('BSD')
pkgdesc='Optimization library'
depends=('python2' 'python2-numpy')
conflicts=('python-openopt')
source=("https://pypi.python.org/packages/source/o/${_pythonname}/${_pythonname}-${pkgver}.tar.gz")

package() {
  cd "$srcdir/${_pythonname}-${pkgver}"

  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  install -D -m 644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
}

md5sums=('513f4f08d786310bbad6285d375ebe4d')
sha256sums=('80dd41ee5b9cbb6b1249d5c585d190d54e1557c5cc8e639d1c8755500161daf0')

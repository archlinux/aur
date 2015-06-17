# Maintainer: nickray <nicolas dot stalder at gmail dot com>

pkgname=python2-bunch
pkgver=1.0.1
pkgrel=3
pkgdesc='A dot-accessible dictionary (a la JavaScript objects)'
arch=(any)
url="http://pypi.python.org/pypi/bunch/"
license=(MIT)
depends=(python2)
source=(http://pypi.python.org/packages/source/b/bunch/bunch-$pkgver.tar.gz)
md5sums=('0a829d64e95ed96defbcae2bf9061bb0')

package() {
  cd bunch-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

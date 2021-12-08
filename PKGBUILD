# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python2-crypto
pkgver=1.4.1
pkgrel=1
pkgdesc='gpg interface'
url='https://github.com/chrissimpkins/crypto'
license=(MIT)
arch=(any)
depends=(python2)
makedepends=(python2-setuptools)
source=("https://files.pythonhosted.org/packages/source/c/crypto/crypto-1.4.1.tar.gz")
b2sums=('06d131e01a2d46f713f9ac2c323acbda8853e7f8ec8d5e22553469ad5ab71efc378caea79b4d384dc7040b9409171ccbdb1434ffbf23cae6412cd9e0e8d31e59')

package_python2-crypto() {
  cd crypto-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 docs/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: robertfoster
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: redfish

pkgname=python-base58
pkgver=2.1.1
pkgrel=1
pkgdesc="Bitcoin-compatible Base58 and Base58Check implementation"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/keis/base58"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v$pkgver.tar.gz")

package() {
  cd ${pkgname##python-}-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('5df25ce3b3d2f7e9d5289b2c75ba9e5291b59b1c34f4f7c90df5ae5f87fe5fb9')

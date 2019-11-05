# Maintainer: robertfoster
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: redfish

pkgname=python-base58
pkgver=1.0.3
pkgrel=3
pkgdesc="Bitcoin-compatible Base58 and Base58Check implementation"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/keis/base58"
license=('MIT')
options=(!emptydirs)
source=("https://github.com/keis/base58/archive/v$pkgver.tar.gz")

package() {
	depends=('python')

	cd ${pkgbase##python-}-$pkgver

	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('42bbd1c40edbac92391c956227b3f2b4')

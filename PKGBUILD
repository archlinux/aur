# Maintainer: Richard Tucker <rtucker@mookins.com>
pkgname=python-argparse-addons
provides=('python-argparse-addons')
pkgdesc="Additional Python argparse types and actions"
url="https://github.com/eerimoq/argparse_addons"
pkgver=0.7.0
pkgrel=1
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('4f01f56df852e7bc28bc8af905c88b7eaf50b3d6caa4f191f33163dd0bb69010b0e936f5515aca93bf68433194da0bf776f6ed976f4b3dc3ed1d465a21c500cb')

package() {
	cd "argparse_addons-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}

# Maintainer: Richard Tucker <rtucker@mookins.com>
pkgname=python-statemachine
provides=('python-statemachine')
pkgdesc="Python finite-state machines made easy"
url="https://github.com/fgmacedo/python-statemachine"
pkgver=0.8.0
pkgrel=1
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3d19355ab29bca5c83c4fe55d6ca4aaf1c71ff2a527cc29e8a9183739f4036240bb21e9b8ebdabd9bf65c7bd1f4c1898bbf81a7ae61e8dfefac3203b6255f4d6')

package() {
	cd "python-statemachine-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}

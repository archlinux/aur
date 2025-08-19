# Maintainer: ethical_haquer <https://smp12.simplex.im/a#QXEXNRW4LE93MotSC7wpMDxwqOBq8zjbflXViqVuETI>

pkgname="python-i18nice"
pkgver=0.16.0
pkgrel=4
pkgdesc="A nice i18n library for Python"
arch=('any')
url="https://github.com/solaluset/i18nice"
license=('MIT')
makedepends=('python-setuptools')
optdepends=('python-yaml: YAML support')
conflicts=('python-i18n')
source=("https://pypi.org/packages/source/i/i18nice/i18nice-$pkgver.tar.gz")
sha256sums=('8e90d042436f4bf0cdf9ab6869eb70946eba094f58121020c350996e45b0be89')

build() {
	cd "i18nice-$pkgver"
	python setup.py build
}

package() {
	cd "i18nice-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

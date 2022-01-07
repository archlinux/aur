# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=sedparse
pkgver=0.1.2
pkgrel=2
pkgdesc='parser for sed scripts'
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url='https://github.com/aureliojargas/sedparse'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aureliojargas/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('81b5c55da8104e54dfdd9ff43b06bfea040f9dabd9453ba44f10cc211389495d')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	python setup.py install --root="$pkgdir" --optimize=1
}


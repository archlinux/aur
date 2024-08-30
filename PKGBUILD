pkgname='lcov-cobertura'
pkgdesc='lcov to cobertura XML converter'
pkgver='2.0.2'
pkgrel=2
arch=('any')
url='https://pypi.org/project/lcov-cobertura/'
license=('Apache-2.0')
depends=('python>=3.6')
makedepends=('python-setuptools')
source=('https://files.pythonhosted.org/packages/56/51/c6aef321778fbdf3d11653dd2cce3af6cba6ba6037295634425f502aafca/lcov_cobertura-2.0.2.tar.gz')
sha512sums=('67a346dea96fe8a4cb0b3a6afadd2135465cf8347d40397d5675b349bed3b131a7456c350ebee0a41ae1c9298b16806813c541e5f84a1f73492002c3da727614')

build() {
	cd "lcov_cobertura-$pkgver/"
	python setup.py build
}

package() {
	cd "lcov_cobertura-$pkgver/"
	python setup.py install --root="$pkgdir" --optimize=1
}

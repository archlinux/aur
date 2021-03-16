# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=zake
pkgname=python-$_pyname
pkgver=0.2.2
pkgrel=1
pkgdesc="A python package that works to provide a nice set of testing utilities for the kazoo library."
arch=(any)
url="https://github.com/yahoo/Zake"
license=(Apache)
depends=(
	python-six
	python-kazoo
)
makedepends=(
	python
	python-setuptools
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('076dcb58f5cb8b50f575fc0ca7e810b9')
sha256sums=('5a50859931c4f666d318b74d1c407a6150dd5194e4c5812d071a5c7c7cefe4e6')
sha512sums=('40da54970553e2e560de2f76c54ab55287e29f99c53c41c2c50fa8642855f1632319aa80e77f4f2ae0a776b94667839385e6323a174cd76219420be71adf7484')

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
}

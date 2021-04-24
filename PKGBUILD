# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=ffmpy
pkgname=python-$_pyname
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple Python wrapper for ffmpeg"
arch=(any)
url="https://github.com/Ch00k/ffmpy"
license=(MIT)
makedepends=(
	python
	python-setuptools
)
depends=(
	python
	ffmpeg
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('633492c6355d857a1c043f490e44e42f')
sha256sums=('757591581eee25b4a50ac9ffb9b58035a2794533db47e0512f53fb2d7b6f9adc')
sha512sums=('8115605978cd55f70734002c04fd3d165476ff2c712f6a30fe06e33ba1005ee12a52c5272d8d95a038e4f7b963f2c0b49fdbfdab1dc75906a91c41a1ec6a82e3')

package(){
	cd "$_pyname-$pkgver"
	python setup.py install --root "$pkgdir" --optimize=1
}

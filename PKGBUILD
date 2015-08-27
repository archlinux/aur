_name=smart-progress
pkgname=python-$_name
pkgver=1.0.1
pkgrel=1
pkgdesc='Smart progressbar with multiple backends selected depending on the environment'
arch=('any')
url="https://github.com/flying-sheep/$_name"
license=('GPLv3')
depends=('python' 'jupyter' 'python-click')
makedepends=('python-pip')
source=("https://pypi.python.org/packages/py3/s/$_name/${_name/-/_}-$pkgver-py3-none-any.whl")
md5sums=('8b7db8b4de3875f5b6db258b79a5e8ca')

package() {
	pip install --root="$pkgdir" --ignore-installed --no-deps "$srcdir/${_name/-/_}-$pkgver-py3-none-any.whl"
}
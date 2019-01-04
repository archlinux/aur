_name=smart-progress
pkgname=python-$_name
pkgver=1.0.2
pkgrel=2
pkgdesc='Smart progressbar with multiple backends selected depending on the environment'
arch=('any')
url="https://github.com/flying-sheep/$_name"
license=('GPL3')
depends=('python' 'jupyter' 'python-click')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/s/$_name/${_name/-/_}-$pkgver-py3-none-any.whl")
md5sums=('e299adff567ae9fd159745efa3bc820b')

package() {
	pip install --root="$pkgdir" --ignore-installed --no-deps "$srcdir/${_name/-/_}-$pkgver-py3-none-any.whl"
}

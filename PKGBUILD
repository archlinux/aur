# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=SimpleITK
pkgname=python-simpleitk
pkgver=1.2.0
pkgrel=2
pkgdesc='A simplified layer built on top of ITK'
arch=('x86_64')
url='https://simpleitk.org/'
license=('apache')
depends=('python')
conflicts=('simpleitk')
makedepends=(
	'cmake'
	'git'
	'python-scikit-build'
	'python-setuptools'
)
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2022769692ed384713f86942bbcdba95912cf310266a70a43771818d4f26254a')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir"
}


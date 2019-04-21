# Maintainer: Johannes Wienke <languitar@semipol.de>
pkgname=pyls-mypy
pkgver=0.1.6
pkgrel=1
pkgdesc="A Mypy plugin for the python language server"
url="https://github.com/tomv564/pyls-mypy"
depends=('python' 'python-language-server' 'mypy' 'python-future')
makedepends=('python3' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/tomv564/pyls-mypy/archive/${pkgver}.tar.gz")
md5sums=('0b0a4f64133a7489d359ea20d1a36dcf')

package() {
	cd "${srcdir}/pyls-mypy-${pkgver}"
	python setup.py install --root="$pkgdir" -v --optimize=1
}

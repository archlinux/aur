# Generated with help from pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild
# Maintainer: MayorBender <7480812+kingy9000@users.noreply.github.com>

pkgname=submit50
_module='submit50' # PyPI specific
pkgver=3.1.0
pkgrel=1
pkgdesc="This is submit50, with which you can submit solutions to problems for CS50."
arch=('any')
url="https://github.com/cs50/submit50"
license=('GPL')
groups=('cs50')
depends=('lib50')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('1eda980ba8fdacc77cd30dfc6cac62248a44e0bab1f7ba2e9d0b38b7d477af8a')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

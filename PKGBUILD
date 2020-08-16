# Generated with help from pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild
# Maintainer: MayorBender <7480812+kingy9000@users.noreply.github.com>

pkgname=submit50
_module='submit50' # PyPI specific
pkgver=3.0.2
pkgrel=1
pkgdesc="This is submit50, with which you can submit solutions to problems for CS50."
arch=('any')
url="https://github.com/cs50/submit50"
license=('GPL')
groups=('cs50')
depends=('python' 'python-pexpect')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('bb3fd00b74d39be92d66ff129e9e9580fefa2e68312be43bd434cda5fe17c618')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

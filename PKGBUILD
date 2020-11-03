# Maintainer: Michael J. Pento <mjpento@verizon.net>
# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=bump2version
pkgver=1.0.1
pkgrel=1
pkgdesc='Version-bump your software with a single command! (bumpversion community fork)'
provides=('bumpversion')
conflicts=('bumpversion')
arch=('any')
url='https://github.com/c4urself/bump2version'
license=('MIT')
depends=('python' 'python-setuptools')
source=("https://pypi.python.org/packages/source/b/bump2version/bump2version-${pkgver}.tar.gz")

build() {
    cd "${srcdir}/bump2version-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/bump2version-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

sha256sums=('762cb2bfad61f4ec8e2bdf452c7c267416f8c70dd9ecb1653fd0bbb01fa936e6')

# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=bumpversion
pkgver=0.5.0
pkgrel=1
pkgdesc='Version-bump your software with a single command!'
arch=('any')
url='https://github.com/peritus/bumpversion'
license=('MIT')
depends=('python')
source=("http://pypi.python.org/packages/source/b/bumpversion/bumpversion-${pkgver}.tar.gz")


build() {
    cd "${srcdir}/bumpversion-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/bumpversion-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
sha256sums=('030832b9b46848e1c1ac6678dba8242a021e35e908b65565800c9650291117dc')

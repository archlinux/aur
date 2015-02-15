# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=bumpversion
pkgver=0.5.1
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

sha256sums=('82c2805d0b1a678b0d228c200d4fbc1dc727920f83bc6e538309bae742518d94')

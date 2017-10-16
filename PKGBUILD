# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=bumpversion
pkgver=0.5.3
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

sha256sums=('6744c873dd7aafc24453d8b6a1a0d6d109faf63cd0cd19cb78fd46e74932c77e')

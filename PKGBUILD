# Maintainer: Zhang.j.k <zhangjk67 at gmail dian com>

pkgbase='konsave'
pkgname=('konsave')
pkgver='1.0.5'
pkgrel=1
pkgdesc="A CLI program that will let you save and apply your KDE Plasma customizations with just one command!"
url="https://github.com/chakki-works/seqeval"
depends=('python' 'python-pyaml')
makedepends=('python' 'python-setuptools')
license=('GPL3')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Prayag2/konsave/archive/v$pkgver.tar.gz")
md5sums=('fbc80c9f7d3310527a2f6231f8f423a0')

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python setup.py build
}

# check() {
#     cd "${srcdir}/${pkgbase}-${pkgver}"
#     python setup.py pytest
# }

package() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}



# Maintainer: Garrett Powell <garrett at gpowell dot net>
pkgbase='python-linotype'
pkgname='python-linotype'
pkgver='0.2.1'
pkgrel=1
pkgdesc='Automatically format help messages.'
arch=('any')
url='https://github.com/lostatc/linotype'
license=('GPL3')
depends=('python-sphinx')
source=("https://files.pythonhosted.org/packages/source/l/linotype/linotype-${pkgver}.tar.gz")
sha256sums=('b8f34003eadee5b8271f96d7791faaa22b82ece3b32524e1a1e4e15cb20079cd')

build() {
    cd "${srcdir}/linotype-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/linotype-${pkgver}"
    python3 setup.py install --root="$pkgdir"
}

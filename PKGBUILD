# Maintainer: Garrett Powell <garrett at gpowell dot net>
pkgbase='python-linotype'
pkgname='python-linotype'
pkgver='0.2.0'
pkgrel=1
pkgdesc='Automatically format help messages.'
arch=('any')
url='https://github.com/lostatc/linotype'
license=('GPL3')
depends=('python-sphinx')
source=("https://files.pythonhosted.org/packages/source/l/linotype/linotype-${pkgver}.tar.gz")
sha256sums=('e16c8ec3c624a45be5b05f45f11c0ac5ec506015ea5212d569bcaedb5fd8f2aa')

build() {
    cd "${srcdir}/linotype-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/linotype-${pkgver}"
    python3 setup.py install --root="$pkgdir"
}

# Maintainer: Garrett Powell <garrett at gpowell dot net>
pkgbase='python-linotype'
pkgname='python-linotype'
pkgver='0.1.1'
pkgrel=1
pkgdesc='Automatically format help messages.'
arch=('any')
url='https://github.com/lostatc/linotype'
license=('GPL3')
depends=('python-sphinx')
source=("https://files.pythonhosted.org/packages/source/l/linotype/linotype-${pkgver}.tar.gz")
sha256sums=('2c60fc1b4f4168284a44f78a0a525639b8a5f2c153b0db1573649155eec9290f')

build() {
    cd "${srcdir}/linotype-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/linotype-${pkgver}"
    python3 setup.py install --root="$pkgdir"
}

# Maintainer: Garrett Powell <garrett at gpowell dot net>
pkgbase='python-linotype'
pkgname='python-linotype'
pkgver='0.1.0.post8'
pkgrel=1
pkgdesc='Automatically format help messages.'
arch=('any')
url='https://github.com/lostatc/linotype'
license=('GPL3')
depends=('python-sphinx')
source=("https://files.pythonhosted.org/packages/source/l/linotype/linotype-${pkgver}.tar.gz")
sha256sums=('a390061e87162c2f83b46f4863a92a206d9874f0b43b5b613584f93fb7a532b8')

build() {
    cd "${srcdir}/linotype-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/linotype-${pkgver}"
    python3 setup.py install --root="$pkgdir"
}

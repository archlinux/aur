# Maintainer: Yury Bondarenko < ybnd at tuta dot io >

pkgname=git-annex-metadata-gui
pkgver=0.2.0
pkgrel=0
pkgdesc='Graphical interface for git-annex metadata commands '
url='https://github.com/alpernebbi/git-annex-metadata-gui'
license=('GPL3')
arch=('any')
depends=('git-annex-adapter' 'python-pyqt5')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alpernebbi/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('25f0c23439918223bf272a4efd168758dfe7a80919dcfff327a7e4a1672bc891')


package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}

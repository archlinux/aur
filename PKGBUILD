# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>
#
# This project does not have a traditional setup.py, so I am just installing
# the source directly into the proper directory for Python 3.7 site packages.

pkgbase='python-mosspy'
pkgname=('python-mosspy')
_module='mosspy'
pkgver='1.0.8'
pkgrel=4
pkgdesc='A Python client for Moss: A System for Detecting Software Similarity'
url='https://github.com/soachishti/moss.py'
depends=(
    'python'
    'python-lxml'
    'python-beautifulsoup4'
)
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=('https://files.pythonhosted.org/packages/33/0b/e562cdb5b5bec2d8fff76d216723793cb6ff90677226b9d340367eee7cf6/mosspy-1.0.8-py2.py3-none-any.whl')
sha256sums=('9387f8137efdea2e089ed7d511acc615caa45fd2e63c0bb59313cdc4bb4dde06')


package() {
    cd "${srcdir}"
    mkdir -p "$pkgdir/usr/lib/python3.9/site-packages/mosspy-1.0.8.dist-info"
    mkdir -p "$pkgdir/usr/lib/python3.9/site-packages/mosspy"
    install -Dm755 mosspy-1.0.8.dist-info/* "$pkgdir/usr/lib/python3.9/site-packages/mosspy-1.0.8.dist-info"
    install -Dm755 mosspy/* "$pkgdir/usr/lib/python3.9/site-packages/mosspy"
}

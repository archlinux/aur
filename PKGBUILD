# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>
#
# This project does not have a traditional setup.py, so I am just installing
# the source directly into the proper directory for Python 3.7 site packages.

pkgbase='python-mosspy'
pkgname=('python-mosspy')
_module='mosspy'
pkgver='1.0.9'
pkgrel=1
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
source=('https://files.pythonhosted.org/packages/d1/ad/da23a5299944b82f4e489c2523dcd361cf34b5218cc1262793b6d43d9e7f/mosspy-1.0.9-py2.py3-none-any.whl')
sha256sums=('7ebae3fc2e84f70a80796fee640fd933511e9da9b5e15920e60e298bb9a785ad')


package() {
    cd "${srcdir}"
    mkdir -p "$pkgdir/usr/lib/python3.9/site-packages/mosspy-1.0.9.dist-info"
    mkdir -p "$pkgdir/usr/lib/python3.9/site-packages/mosspy"
    install -Dm755 mosspy-1.0.9.dist-info/* "$pkgdir/usr/lib/python3.9/site-packages/mosspy-1.0.9.dist-info"
    install -Dm755 mosspy/* "$pkgdir/usr/lib/python3.9/site-packages/mosspy"
}

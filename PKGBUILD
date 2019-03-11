# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>
#
# This project does not have a traditional setup.py, so I am just installing
# the source directly into the proper directory for Python 3.7 site packages.

pkgbase=('python-mosspy')
pkgname=('python-mosspy')
_module='mosspy'
pkgver='1.0.7'
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
source=('https://files.pythonhosted.org/packages/8e/34/18aa21e6d7a6c2ba7c239826702e7b199c1eff4707f8368b4e7fa85af9b2/mosspy-1.0.7-py2.py3-none-any.whl')
sha256sums=('a2595fd587c07c2f21fb7d9989273ca1923c208f735d9605004c4b1bb3707a07')


package() {
    cd "${srcdir}"
    mkdir -p "$pkgdir/usr/lib/python3.7/site-packages/mosspy-1.0.7.dist-info"
    mkdir -p "$pkgdir/usr/lib/python3.7/site-packages/mosspy"
    install -Dm755 mosspy-1.0.7.dist-info/* "$pkgdir/usr/lib/python3.7/site-packages/mosspy-1.0.7.dist-info"
    install -Dm755 mosspy/* "$pkgdir/usr/lib/python3.7/site-packages/mosspy"
}

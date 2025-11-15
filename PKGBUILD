# Maintainer: Benevant Mathew <benevantmathewv@gmail.com>

pkgname=dircomply
pkgver=1.0.0
pkgrel=1
pkgdesc="Compare the files between two project folders."
arch=('any')
url="https://pypi.org/project/dircomply/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('72e6a7b7f408c7f0859ccf9ca5a60d9aebc0f151943299f6e5bf48dc1e48418f')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}


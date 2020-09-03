# Maintainer: bunburya
pkgname=bother
pkgver=0.1
pkgrel=1
pkgdesc="Produce heightmaps using real-world elevation data (primarily for use in OpenTTD)."
url="https://github.com/bunburya/bother"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=('https://files.pythonhosted.org/packages/2e/09/6acd600a5f8cfb5c2539e0ad617b9502f91cb5381cc0ab1fb226873ab0a2/Bother-0.1.tar.gz')
md5sums=('9e45f1ad50c251c542c9d8048177c36e')

build() {
    cd $srcdir/Bother-0.1
    python setup.py build
}

package() {
    cd $srcdir/Bother-0.1
    python setup.py install --root="$pkgdir" --optimize=1 
}

# Maintainer: brodokk <brodokk at brodokk dot space>

_pkgname=flake8-assertive
pkgname=python-$_pkgname

pkgver=2.1.0
pkgrel=1
pkgdesc="Flake8 unittest assert method checker"

url='https://github.com/jparise/flake8-assertive'
arch=('any')
license=('MIT')

depends=('python')

source=("https://github.com/jparise/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('6855ca591db0ad436fbadcdd885e44ea8dae447b3c456099ef7e239fe9cda0b3a1f28ee558f2f4e10cc50a2579a26decc016cb5bcd03c08ca4b426c775769754')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}


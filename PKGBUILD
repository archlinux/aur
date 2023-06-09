# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=python-simple_parsing
pkgver=0.1.3
pkgrel=1
pkgdesc="Simple, Elegant, Typed Argument Parsing with argparse"
arch=('any')
url="https://github.com/lebrice/SimpleParsing"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lebrice/SimpleParsing/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5c6fb481d736db9cc57c65cd1ecf4c3d106a14efe971c27b65af1a402cc525dd')

package() {
    cd "SimpleParsing-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

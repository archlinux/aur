# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=python-simple_parsing
pkgver=0.1.2
pkgrel=1
pkgdesc="Simple, Elegant, Typed Argument Parsing with argparse"
arch=('any')
url="https://github.com/shanedabes/fzf-template"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lebrice/SimpleParsing/archive/refs/tags/v${pkgver}.post1.tar.gz")
sha256sums=('b3927f9d003eb2f6786b962c9c8f9f70fb7685c4f7eda6b171ba176bf9962061')

package() {
    cd "SimpleParsing-${pkgver}.post1"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

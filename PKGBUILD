# Maintainer: Anthony <.com>
pkgname=deepseek-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Cliente CLI para DeepSeek com contexto de arquivos"
arch=('any')
url="https://github.com/seuusuario/deepseek-cli-assistant"
license=('MIT')
depends=('python' 'python-requests' 'python-rich' 'python-tqdm' 'python-dotenv')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
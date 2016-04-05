# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-pydub
pkgver=0.16.4
pkgrel=1
pkgdesc="Manipulate audio with an simple and easy high level interface"
url="http://pydub.com"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/jiaaro/pydub/archive/v$pkgver.tar.gz")

build() {
    cd $srcdir/pydub-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/pydub-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha1sums=('30bda493a4572571ae3bfcf8966da31ec5fcd0fd')
sha256sums=('b510e067f253d8bbb928034310adf0e0ad1b80592cc8f2588218f6bf6a71bc4a')
sha512sums=('4027ffa5faca54f86de5b40969e5f8ffceed41ba6bd175affc7de2bed40c08deae702103fa2027e593071efa252b156164b431e686f28f87a72f5f96e7134bb9')

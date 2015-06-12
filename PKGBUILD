# Maintainer Simon Legner <Simon.Legner@gmail.com>

pkgname=python-pydub
pkgver=0.11.0
pkgrel=1
pkgdesc="Manipulate audio with an simple and easy high level interface"
url="http://pydub.com"
depends=('python' )
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
}

sha1sums=('e792f865d4d423741f138f4ddd9a886d6ebc9008')
sha256sums=('23e6e82515ceda9296c78a0ade74bd6b4d5a5aee74cb971fcc025e2401057a12')
md5sums=('853d0d25cfc43ae1b67c849f86341c10')

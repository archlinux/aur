# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-pydub
pkgver=0.16.0
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

md5sums=('3efb6be61a34e32c075a5552850120ee')
sha1sums=('d0864060621e0bc1a4307e6bc192f278d7d130ec')
sha256sums=('83aab4fa743315fe37fbbc3b6e4b406e28e58ca1e1b0e020fe4986f3843a7cbd')
sha512sums=('9a990de6ce315591540f59079550ccce19e873f58b29c35b3636763d21993a756d1b0f7e148f3f582ddd2824f26d0a24e56971e1164b8463ebc24ad6723f32a1')

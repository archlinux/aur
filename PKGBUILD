# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-pydub
pkgver=0.16.3
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

md5sums=('00770091c476dd6762574c294be3fced')
sha1sums=('42afed1071bda2c113a574ad45c60fb07c4124cc')
sha256sums=('4c5e975328fcc7bfb09698bf8810ebc6e34396aaf1d966b2a1e057578eca87fd')
sha512sums=('2b2a79306ef06cda0d890e7f5b14d1be4fcc7cf4fcacbbe2d6b87c92316f596373bf152397bcf5600a4b974108a2dfb7ada8d8bff22b03fc7638c4029650afa9')

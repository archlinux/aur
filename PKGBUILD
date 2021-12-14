# Maintainer: Kenny MacDermid <kenny.macdermid@gmail.com>
pkgname=aws-adfs
pkgver=1.24.5
pkgrel=2
pkgdesc="Command line tool to ease aws cli authentication against ADFS "
arch=('any')
url="https://github.com/venth/aws-adfs"
license=('MIT')
depends=('python' 'python-lxml' 'python-click' 'python-botocore'
  'python-requests' 'python-fido2')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/venth/aws-adfs/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2ae5c8c657fea869ad65680e580815b5948b11909869060ccfd707719c73b59e')
sha512sums=('3c49993b85e129d73781e0418b0c7d7461566a8ede7224a11aea746456b3c22b92733c75966aa653f15fe656d0a9b9f38ae31ad4e13e73e342a021d73b440596')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

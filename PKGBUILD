# Maintainer: Kenny MacDermid <kenny.macdermid@gmail.com>
pkgname=aws-adfs
pkgver=1.24.5
pkgrel=1
pkgdesc="Command line tool to ease aws cli authentication against ADFS "
arch=('any')
url="https://github.com/venth/aws-adfs"
license=('MIT')
depends=('python' 'python-lxml' 'python-click' 'python-botocore'
  'python-requests' 'python-fido2')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/venth/aws-adfs/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('003b214e4c664659ac72bcce67f034176068ec974f8e8eb051624956470ef1cd')
sha512sums=('c0507743b6545510cf0fd7272a61a87fbcb56c300228ff9ae1deb8023d7f71e6935f541820ac73e94b22f7a50651eef89a38daf5f168d5d6a8edb2c89f663529')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

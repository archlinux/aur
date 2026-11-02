# Maintainer: lucaszhou007 <lucaszhou007@163.com>
pkgname=les11-mc-dx-temperature-reader
pkgver=1.0.0
pkgrel=2
pkgdesc="Read the LES11-MC-Dx USB temperature sensor over Modbus RTU"
arch=('any')
license=('0BSD')
url="http://www.lesminer.com/productinfo/180794.html"
depends=('python' 'python-pyserial')
source=("les11-mc-dx-reader.py" "LICENSE")
b2sums=('20fbcf08b2d22193edff328c547a78f615de50e3858f12a435256f04ff638534354a7ad8cb9d9b9208b58aebc25b471bf6970505f6de498302f06e295cb28528'
        'a58bbb51ab7667a799cdc0b3e2229f06484483761351456acb8d08b7ef85c18286016287ad9e7da3f44658472e6f2567173a992ba3f310c1e90a138ab858a9f7')

package() {
  install -Dm755 "$srcdir/les11-mc-dx-reader.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

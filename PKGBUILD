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
        'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

package() {
  install -Dm755 "$srcdir/les11-mc-dx-reader.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

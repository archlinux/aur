# Maintainer: lucaszhou007 <lucaszhou007@163.com>
pkgname=les11-mc-dx-temperature-reader
pkgver=1.0.0
pkgrel=1
pkgdesc="Read the LES11-MC-Dx USB temperature sensor over Modbus RTU"
arch=('any')
license=('0BSD')
url="http://www.lesminer.com/productinfo/180794.html"
depends=('python' 'python-pyserial')
source=("les11-mc-dx-reader.py" "LICENSE")
b2sums=('b4bed81e8ae601bc490666aaa35b3ca9cf724ce4bc9b3cbb7add1e033810f6d11be9740d1f675fc9b601d075e6546d15c776407e8b566540c693fe83a309d199'
        'a58bbb51ab7667a799cdc0b3e2229f06484483761351456acb8d08b7ef85c18286016287ad9e7da3f44658472e6f2567173a992ba3f310c1e90a138ab858a9f7')

package() {
  install -Dm755 "$srcdir/les11-mc-dx-reader.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

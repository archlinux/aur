## Contributor: Markus Maiwald <mail@maiwald.tk>
## Maintainer: zoe <chp321@gmail.com>

pkgname=squeak-image
pkgver=5.0
bid=15113
pkgrel=1
arch=('any')
pkgdesc="Image file for squeak VM"
url="http://www.squeak.org"
license=('custom:MIT' 'custom:XEROX' 'APACHE')
depends=('squeak-vm')
source=(http://ftp.squeak.org/$pkgver/Squeak$pkgver-$bid.zip)
md5sums=('b89d56eebd65e9955cd78fa9de3e67cd')

package() {
  mkdir -p $pkgdir/usr/lib/squeak

  install -m644 Squeak$pkgver-$bid.image $pkgdir/usr/lib/squeak/Squeak$pkgver-$bid.image
  install -m644 Squeak$pkgver-$bid.changes $pkgdir/usr/lib/squeak/Squeak$pkgver-$bid.changes

  ln -s Squeak$pkgver-$bid.image $pkgdir/usr/lib/squeak/squeak.image
  ln -s Squeak$pkgver-$bid.changes $pkgdir/usr/lib/squeak/squeak.changes
}
## Contributor: Markus Maiwald <mail@maiwald.tk>
## Maintainer: zoe <chp321@gmail.com>

pkgname=squeak-image
pkgver=4.6
bid=14191
pkgrel=3
arch=('any')
pkgdesc="Image file for squeak VM"
url="http://www.squeak.org"
license=('custom:MIT' 'custom:XEROX' 'APACHE')
depends=('squeak-vm')
source=(http://ftp.squeak.org/current_development/Squeak$pkgver-$bid.zip)
md5sums=('67074af2126af4b54b9edbf74250cc12')

package() {
  mkdir -p $pkgdir/usr/lib/squeak

  install -m644 Squeak$pkgver-$bid.image $pkgdir/usr/lib/squeak/Squeak$pkgver-$bid.image
  install -m644 Squeak$pkgver-$bid.changes $pkgdir/usr/lib/squeak/Squeak$pkgver-$bid.changes

  ln -s Squeak$pkgver-$bid.image $pkgdir/usr/lib/squeak/squeak.image
  ln -s Squeak$pkgver-$bid.changes $pkgdir/usr/lib/squeak/squeak.changes
}
## Maintainer: fqqbar
## Contributor: Markus Maiwald <mail@maiwald.tk>
## Contributor: zoe <chp321@gmail.com>

pkgname=squeak-image-4.5
pkgver=4.5
bid=13680
pkgrel=1
arch=('any')
pkgdesc="Image file for squeak VM"
url="http://www.squeak.org"
license=('custom:MIT' 'custom:XEROX' 'APACHE')
depends=('squeak-vm')
source=(http://ftp.squeak.org/${pkgver}alpha/Squeak$pkgver-$bid.zip)
sha512sums=('9de0a7a5ec5d3e13cace5be419c500f6c6074912acfedeec60732110438e8d712599d175f620d2fabac9827e3d54f3935a8c5c093c8b906e0374f4ec270d3456')

package() {
  mkdir -p $pkgdir/usr/lib/squeak

  install -m644 Squeak$pkgver-$bid.image $pkgdir/usr/lib/squeak/Squeak$pkgver-$bid.image
  install -m644 Squeak$pkgver-$bid.changes $pkgdir/usr/lib/squeak/Squeak$pkgver-$bid.changes
}

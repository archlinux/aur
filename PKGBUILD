# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=cool
pkgver=0.1
pkgrel=1
pkgdesc="A little script that plays a random MOD file from modarchive.org"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL3')
depends=('curl' 'xmp')
source=("$pkgname::https://gist.githubusercontent.com/orhun/eda9701e357b625c2bada19563872715/raw/24e3a123f4024021c30bba2c77474832ede683ec/cool.sh")
sha512sums=('SKIP')

package() {
  install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
}
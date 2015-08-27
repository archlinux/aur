# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=seatools
pkgdesc='The quick diagnostic tool that checks the health of your Seagate drive'
pkgver=2.64
pkgrel=1
arch=(i686 x86_64)
url='http://www.seagate.com/support/downloads/seatools/'
license=(custom:proprietary)
depends=(lib32-glibc)
source=(http://www.seagate.com/files/www-content/support-content/downloads/seatools/_shared/downloads/seatools_cli.tar )
sha1sums=('9e9dbd61b8d7c156f864743a2109efce6dd75051')

package() {
  install -Dm755 st "$pkgdir"/usr/bin/st
  install -Dm644 sthelp.txt "$pkgdir"/usr/share/doc/seatools/sthelp.txt
}

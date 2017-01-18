# $Id$
# Maintainer: Michael Bostwick <mbostwick89 at googlemail dot com>

pkgname=nosegrind-font
pkgver=1
_relver=1
pkgrel=1
pkgdesc="Font that looks like graffiti"
url="http://www.dafont.com/nosegrind.font"
arch=(any)
license=(custom)
_zipname=nosegrind.zip
source=("$_zipname::http://dl.dafont.com/dl/?f=nosegrind")
sha256sums=('bcce4b973c44b94d4f779a510a128a9b3a4d11231eeb106bafbe8e0e0985dd50')
makedepends=("zip")

package() {
  unzip -o nosegrind.zip
  install -Dm644 NOSED___.TTF  "$pkgdir/usr/share/fonts/NOSED___.TTF"
}

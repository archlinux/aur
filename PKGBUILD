# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=mql
originalVersion="14.7.0"
pkgver="${originalVersion/-/_}"
pkgrel=1
pkgdesc="Cloud-Native Query - Asset Inventory Framework"
url="https://mondoo.com"
license=('BUSL-1.1')
source=("https://releases.mondoo.com/mql/${originalVersion}/mql_${originalVersion}_linux_amd64.tar.gz"
    )
arch=('x86_64')
depends=()
conflicts=('cnquery')
replaces=('cnquery')
sha256sums=('f479ffbe3c59c68a81271175874fa661571936981a8105fe3b16858e699d1081'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.

  
}

#vim: syntax=sh
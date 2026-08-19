# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=mql
orignalVersion="13.35.0"
pkgver="${orignalVersion/-/_}"
pkgrel=1
pkgdesc="Cloud-Native Query - Asset Inventory Framework"
url="https://mondoo.com"
license=('BUSL-1.1')
source=("https://releases.mondoo.com/mql/${orignalVersion}/mql_${orignalVersion}_linux_amd64.tar.gz"
    )
arch=('x86_64')
depends=()
conflicts=('cnquery')
replaces=('cnquery')
sha256sums=('543862dfe5b3ad053e3e09b38d51474415d1c476f484dae39e82754973d641f6'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.

  
}

#vim: syntax=sh
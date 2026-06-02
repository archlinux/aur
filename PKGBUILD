# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=mql
orignalVersion="13.21.0"
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
sha256sums=('73f051520320e0a973820c7d1c290bc820ba0baabc86eb86f9682d735d181f60'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.

  
}

#vim: syntax=sh
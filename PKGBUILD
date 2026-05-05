# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=mql
orignalVersion="13.8.1"
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
sha256sums=('e5e0cf1e6071204465d3de27b169e9ce4a5743c5391acf934327d3371d83444b'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.

  
}

#vim: syntax=sh
# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=mql
orignalVersion="13.31.0"
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
sha256sums=('0fdf08d0f6a9264cfccf744aef709b25148979cb07705b6d5cedb117e35c9d53'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.

  
}

#vim: syntax=sh
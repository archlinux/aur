# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=cnquery
orignalVersion="9.7.0"
pkgver="${orignalVersion/-/_}"
pkgrel=1
pkgdesc="Cloud-Native Query - Asset Inventory Framework"
url="https://mondoo.com"
license=('MPL 2.0')
source=(
    "https://releases.mondoo.com/cnquery/${orignalVersion}/cnquery_${orignalVersion}_linux_amd64.tar.gz"
    )
arch=('x86_64')
depends=()

sha256sums=('94b650df39190cdc603052fddfaf2dd9e235e930a2aea735daeed3efea7c186d'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.

  
}

#vim: syntax=sh
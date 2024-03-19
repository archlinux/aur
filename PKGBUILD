# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=cnquery
orignalVersion="10.8.2"
pkgver="${orignalVersion/-/_}"
pkgrel=1
pkgdesc="Cloud-Native Query - Asset Inventory Framework"
url="https://mondoo.com"
license=('BUSL-1.1')
source=("https://releases.mondoo.com/cnquery/${orignalVersion}/cnquery_${orignalVersion}_linux_amd64.tar.gz"
    )
arch=('x86_64')
depends=()

sha256sums=('c9a7ef60562e6a063686e1b4a88527fe10f75c9a9b679f638485316de48dd86f'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.

  
}

#vim: syntax=sh
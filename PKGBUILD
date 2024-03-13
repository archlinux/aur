# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=cnquery
orignalVersion="10.7.1"
pkgver="${orignalVersion/-/_}"
pkgrel=1
pkgdesc="Cloud-Native Query - Asset Inventory Framework"
url="https://mondoo.com"
license=('BUSL-1.1')
source=("https://releases.mondoo.com/cnquery/${orignalVersion}/cnquery_${orignalVersion}_linux_amd64.tar.gz"
    )
arch=('x86_64')
depends=()

sha256sums=('2d7f7c8bfa5dd69ebcbeea3d2a8c0ec987f137764d97059b300dc0fb430a82c1'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.

  
}

#vim: syntax=sh
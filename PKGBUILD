# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=cnquery
orignalVersion="8.3.0"
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

sha256sums=('96b81d2a6cbd34cc3049f18ed7eed4ce7cb9c88a8a70181a289980efaea12159'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.

  
}

#vim: syntax=sh
# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=cnquery
orignalVersion="8.24.3"
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

sha256sums=('62cf377634a8e043bbc359bae9f6271627b0bc8d496d95d6ec14cce83f7ad83d'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.

  
}

#vim: syntax=sh
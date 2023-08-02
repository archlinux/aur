# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=cnspec
orignalVersion="8.21.1"
pkgver="${orignalVersion/-/_}"
pkgrel=1
pkgdesc="Cloud-Native Security and Policy Framework "
url="https://mondoo.com"
license=('MPL 2.0')
source=(
    "https://releases.mondoo.com/cnspec/${orignalVersion}/cnspec_${orignalVersion}_linux_amd64.tar.gz"
    )
arch=('x86_64')
depends=('cnquery')

sha256sums=('e955cc212f9c6a093e27a73d0a7181502682df859662177f85b9a9da4a0021d9'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.

  
}

#vim: syntax=sh
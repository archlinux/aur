# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=cnspec
orignalVersion="9.10.0"
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

sha256sums=('d92d06f026f7ca77da570ee77e582880ae9a49510236901004ab6a66ad12f42e'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.

  
}

#vim: syntax=sh
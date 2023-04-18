# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=cnspec
orignalVersion="8.5.3"
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

sha256sums=('12d6857633f6ceeff2aa9459d73000759ca1c6bb1f6af1a41930d4db1ff1e8e7'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.

  
}

#vim: syntax=sh
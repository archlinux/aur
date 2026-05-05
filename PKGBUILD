# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=cnspec
orignalVersion="13.8.0"
pkgver="${orignalVersion/-/_}"
pkgrel=1
pkgdesc="Cloud-Native Security and Policy Framework "
url="https://mondoo.com"
license=('BUSL-1.1')
source=("https://releases.mondoo.com/cnspec/${orignalVersion}/cnspec_${orignalVersion}_linux_amd64.tar.gz"
    )
arch=('x86_64')
depends=('mql')
conflicts=('cnquery')
replaces=('cnquery')
sha256sums=('877f8f3867c88a191ae166f6592189efe475fd2e77cde95f533db301cf3a30e4'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.
  ln -s /usr/bin/cnspec "${pkgdir}/usr/bin/cnquery"

  
}

#vim: syntax=sh
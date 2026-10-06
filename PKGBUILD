# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=cnspec
originalVersion="14.3.1"
pkgver="${originalVersion/-/_}"
pkgrel=1
pkgdesc="Cloud-Native Security and Policy Framework "
url="https://mondoo.com"
license=('BUSL-1.1')
source=("https://releases.mondoo.com/cnspec/${originalVersion}/cnspec_${originalVersion}_linux_amd64.tar.gz"
    )
arch=('x86_64')
depends=('mql')
conflicts=('cnquery')
replaces=('cnquery')
sha256sums=('29570a78e483e57bb7607dbe2ea09fec2a5531456d01fa9ae3216bf2c64b2ace'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.
  ln -s /usr/bin/cnspec "${pkgdir}/usr/bin/cnquery"

  
}

#vim: syntax=sh
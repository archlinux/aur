# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=cnspec
originalVersion="14.3.0"
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
sha256sums=('c322de639dbe38a788e5e6d1656fd6d3cada42082bf7600a17d509f5fa5ba37d'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.
  ln -s /usr/bin/cnspec "${pkgdir}/usr/bin/cnquery"

  
}

#vim: syntax=sh
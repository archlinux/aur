# Maintainer: Mondoo Inc <hello@mondoo.com>
# Maintainer: Dominik Richter <dom@mondoo.com>
# Maintainer: Patrick Münch <patrick@mondoo.com>
#
pkgname=cnspec
orignalVersion="11.5.0"
pkgver="${orignalVersion/-/_}"
pkgrel=1
pkgdesc="Cloud-Native Security and Policy Framework "
url="https://mondoo.com"
license=('BUSL-1.1')
source=("https://releases.mondoo.com/cnspec/${orignalVersion}/cnspec_${orignalVersion}_linux_amd64.tar.gz"
    )
arch=('x86_64')
depends=('cnquery')

sha256sums=('a1eeeb76c3e0abf61c9e933b8592ff31f27641083af979d92ede3f45e6938844'
            )


package() {
  install -dm755 ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname ${pkgdir}/usr/bin/.

  
}

#vim: syntax=sh
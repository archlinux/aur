# Maintainer:  Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=arteget
pkgver=3.3
pkgrel=1
pkgdesc="Dump television programs from the +7 site of Arte"
arch=('x86_64')
url="https://github.com/trou/arteget"
license=('GPL2')
depends=('ruby' 'rtmpdump')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trou/arteget/archive/release-3.3.tar.gz")
sha256sums=('655d027e3315d4deef39990ec3114550c86d3c594c97168f30a026fb6d30bd10')

package() {
  cd "${srcdir}/${pkgname}-release-${pkgver}"

  install -Dm 0755 arteget.rb "${pkgdir}/usr/bin/arteget"
}

# vim:set ts=2 sw=2 et:

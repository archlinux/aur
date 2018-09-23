# Maintainer:  Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

pkgname=arteget
pkgver=3.2
pkgrel=1
pkgdesc="Dump television programs from the +7 site of Arte"
arch=('x86_64')
url="https://github.com/trou/arteget"
license=('GPL2')
depends=('ruby' 'rtmpdump')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trou/arteget/archive/release-3.2.tar.gz")
sha256sums=('ec2c990d2f00e2d6529820b9d9fbc47cf78af6d76d93e8d9639853dbe140685a')

package() {
  cd "${srcdir}/${pkgname}-release-${pkgver}"

  install -Dm 0755 arteget.rb "${pkgdir}/usr/bin/arteget"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Victor Häggqvist <aur a snilius d com>
# Any Co-Maintainers are welcome

pkgname=otto
pkgver=0.1.0
pkgrel=1
pkgdesc='Development and Deployment Made Easy (Successor of Vagrant)'
url="https://ottoproject.io/"
arch=('x86_64')
license=('Mozilla Public License, version 2.0')
depends=('go')
source=(otto.zip::https://dl.bintray.com/mitchellh/otto/otto_0.1.0_linux_amd64.zip)
sha256sums=('472ea087c3aca02174edea5dda8e61d7aca680703887d07e566a214b748ebb89')


package() {
  install -Dm0755 ${srcdir}/otto ${pkgdir}/usr/bin/otto
}

# vim:set ts=2 sw=2 et:

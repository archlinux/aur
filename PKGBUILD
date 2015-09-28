# Maintainer: Victor Häggqvist <aur a snilius d com>
# Any Co-Maintainers are welcome

pkgname=otto
pkgver=0.1.0
pkgrel=2
pkgdesc='Development and Deployment Made Easy (Successor of Vagrant)'
url="https://ottoproject.io/"
arch=('i686' 'x86_64' 'arm')
license=('MPL')

source_i686=("https://dl.bintray.com/mitchellh/otto/otto_${pkgver}_linux_386.zip")
source_x86_64=("https://dl.bintray.com/mitchellh/otto/otto_${pkgver}_linux_amd64.zip")
source_arm=("https://dl.bintray.com/mitchellh/otto/otto_${pkgver}_linux_arm.zip")

sha256sums_i686=("d2de23064d93cd3d3199d208371f9b3184d949961c243d084ff5d7e47019fc7d")
sha256sums_x86_64=("472ea087c3aca02174edea5dda8e61d7aca680703887d07e566a214b748ebb89")
sha256sums_arm=("f3c180a21af9a5037e077f6c984bf5d94a849c2d4d7d7d2655c5f221b92d1b3a")


package() {
  install -Dm0755 ${srcdir}/otto ${pkgdir}/usr/bin/otto
}

# vim:set ts=2 sw=2 et:

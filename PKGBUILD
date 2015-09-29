# Maintainer: Victor Häggqvist <aur a snilius d com>
# Any Co-Maintainers are welcome
# https://github.com/victorhaggqvist/archlinux-pkgbuilds/tree/otto

pkgname=otto
pkgver=0.1.1
pkgrel=1
pkgdesc='Development and Deployment Made Easy (Successor of Vagrant)'
url="https://ottoproject.io/"
arch=('i686' 'x86_64' 'arm')
license=('MPL')

source_i686=("https://dl.bintray.com/mitchellh/otto/otto_${pkgver}_linux_386.zip")
source_x86_64=("https://dl.bintray.com/mitchellh/otto/otto_${pkgver}_linux_amd64.zip")
source_arm=("https://dl.bintray.com/mitchellh/otto/otto_${pkgver}_linux_arm.zip")

sha256sums_i686=("4430fc1e6c3dce5048a2d9ae8a897feab1209b1a4d33ee97d233cb2f5ae60943")
sha256sums_x86_64=("6e36a81b896881aec9a4169140821ed36ff4e2757095dbe28c1961ee7ea72513")
sha256sums_arm=("abc5cce40777cad937ddfdf11dd706d62e321c492cd1a589060ccb6b4a12a5bc")


package() {
  install -Dm0755 ${srcdir}/otto ${pkgdir}/usr/bin/otto
}

# vim:set ts=2 sw=2 et:

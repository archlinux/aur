# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Andreas Gerlach <andigerlach76@gmail.com> 

pkgname=docker-machine-kvm
pkgver=0.7.0
pkgrel=1
pkgdesc="KVM driver for docker-machine"
url="https://github.com/dhiltgen/docker-machine-kvm"
license=('Apache')
arch=('x86_64')
depends=(
  'docker-machine'
  'libvirt'
)
optdepends=(
  'docker: to manage the containers in the machine'
)
makedepends=()

source=('https://github.com/dhiltgen/docker-machine-kvm/releases/download/v${pkgver}/docker-machine-driver-kvm')
sha256sums=('c4ff3eeb5b232aad41942feb8fb46aaaf8d54239408e2f6549468c997a845a31')

package() {
  cd ""
  install -d "/usr/bin"
  install -m755 docker-machine-driver-kvm "/usr/bin/docker-machine-driver-kvm"
}

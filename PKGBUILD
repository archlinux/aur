# Maintainer: Brad Erhart <brae.04+aur@gmail.com> 
pkgname=docker-machine-driver-kvm2
pkgver=0.25.2
pkgrel=1
pkgdesc="Minikube-maintained KVM driver for docker-machine"
url="https://github.com/kubernetes/minikube"
license=('Apache')
arch=('x86_64')
depends=(
  'docker-machine'
  'libvirt'
  'ebtables'
  'dnsmasq'
)
optdepends=(
  'docker: to manage the containers in the machine'
)
makedepends=()

source=("https://github.com/kubernetes/minikube/releases/download/v$pkgver/docker-machine-driver-kvm2")
sha256sums=('76578ebfd22d17230397131f9ddfc8f66581ded3f2040bde7dc5be427fe1b39a')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 docker-machine-driver-kvm2 "$pkgdir/usr/bin/docker-machine-driver-kvm2"
}

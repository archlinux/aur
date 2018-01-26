# Maintainer: Brad Erhart <brae.04+aur@gmail.com> 
pkgname=docker-machine-driver-kvm2
pkgver=0.25.0
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
sha256sums=('30cc9269e8ddfab24640796735ec7e28aa97e95600ac44f5f85839cc0801d189')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 docker-machine-driver-kvm2 "$pkgdir/usr/bin/docker-machine-driver-kvm2"
}

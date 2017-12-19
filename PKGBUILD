# Maintainer: Brad Erhart <brae.04+aur@gmail.com> 
pkgname=docker-machine-driver-kvm2
pkgver=0.24.1
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
sha256sums=('e1cafeacb90e453181877d03cfbbd2972e2c75c695588efea4efa1a887167812')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 docker-machine-driver-kvm2 "$pkgdir/usr/bin/docker-machine-driver-kvm2"
}

# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=docker-machine-driver-kvm2
pkgver=1.19.0
pkgrel=1
pkgdesc='Minikube-maintained KVM driver for docker-machine'
url='https://minikube.sigs.k8s.io'
license=('Apache')
arch=('x86_64')
depends=(
	'dnsmasq'
	'docker-machine'
	'iptables'
	'libvirt'
)
optdepends=('docker: to manage the containers in the machine')
source=("$pkgname-$pkgver::https://storage.googleapis.com/minikube/releases/v$pkgver/$pkgname-amd64")
sha256sums=(5975a9f05040d795fcd0a8b6474e8f7c53ba2f4b34f3b9ad2bc834f60af781e1)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}

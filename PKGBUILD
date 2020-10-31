# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=docker-machine-driver-kvm2
pkgver=1.14.2
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
sha256sums=(072559871e7d2801c9dd1b05a256abf98d6e75449fe540107fba8789cc9a8787)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}

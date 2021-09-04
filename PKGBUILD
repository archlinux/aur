# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=docker-machine-driver-kvm2
pkgver=1.23.0
pkgrel=1
pkgdesc='Minikube-maintained KVM driver for docker-machine'
url='https://minikube.sigs.k8s.io'
license=('Apache')
arch=('x86_64')
_goarch='amd64'
depends=(
	'dnsmasq'
	'docker-machine'
	'iptables-nft'
	'libvirt'
	'qemu-headless'
)
optdepends=('docker: to manage the containers in the machine')
source=("$pkgname-$pkgver::https://storage.googleapis.com/minikube/releases/v$pkgver/$pkgname-$_goarch")
b2sums=(d73ee1f686b2acdce1a16d677fc77f0b98fa273b1e89d86bb05f96c7588290cf3fdcd970ca218cfa1bba10cb9e9070d7c97f4eb133b3da20932e13830647565a)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}

# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=docker-machine-driver-kvm2
pkgver=1.14.0
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
sha256sums=(6dd9e9c275ea00c50d8307f1d4a908b2ba90162c570fabc1e10f56a80e13b959)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}

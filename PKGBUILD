# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=docker-machine-driver-kvm2
pkgver=1.13.1
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
sha256sums=(129849682cd5b3f51ae2c3ad88fc26b7e496b3adfa1cf069061efd970aa26054)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}

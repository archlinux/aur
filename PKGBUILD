# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=docker-machine-driver-kvm2
pkgver=1.20.0
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
sha256sums=(544cba5ee08edea19d1fc7591de8dad93aaa05bee61cdf73b661bb92b5b9f45f)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}

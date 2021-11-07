# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=docker-machine-driver-kvm2
pkgver=1.24.0
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
b2sums=(cd50302674c68ae9db3eceaed3e388cd72419ea0a076a6621be3c20851c9936a04e5082a0b07ed7a2f631ee981d0ce5b52527300c22aec2825dd7ec7c037e57b)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}

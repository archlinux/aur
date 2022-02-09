# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=docker-machine-driver-kvm2
pkgver=1.25.1
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
b2sums=(9c0ede12970a6612d7820b8db99a9972755f637f02697ea08ee67ba6cda85499318e46964920136f3da6840650ee6bcfe77cd4c2456bbfcec41057c99063c0df)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}

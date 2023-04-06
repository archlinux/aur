# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=docker-machine-driver-kvm2
pkgver=1.30.1
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
	'qemu'
)
optdepends=('docker: to manage containers in the machine')
source=("${pkgname}-${pkgver}"::"https://storage.googleapis.com/minikube/releases/v${pkgver}/${pkgname}-${_goarch}")
b2sums=('27a9e93981b85527973d4a0ea74d921e9501b395bc7138b54ab9d5ca9bc8bad9835b5e68c463d98e2766d714c7f89a96249d9b4b3bc8415a2097c44eda989f62')

package() {
	install -D --mode 755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}

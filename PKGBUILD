# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=docker-machine-driver-kvm2
pkgver=1.29.0
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
b2sums=('81e498c077d4976dadc15b3e9d780a14fcc5ac4ee6f89fb25cebf437ea8e313c6c84cd185f7d3c24aa56adefed1041a0155ec48520a1f82c97d4261461bb4733')

package() {
	install -D --mode 755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}

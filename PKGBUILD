# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=docker-machine-driver-kvm2
pkgver=1.27.1
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
b2sums=('77a33078e73414aec3d861faa9d9234d7215ca30602a573e144c4f28d1e2c7ce7df6654da3bc9c040d5057527ce6598e7543afee87c2ced2f28695a4895a28e2')

package() {
	install -D --mode 755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}

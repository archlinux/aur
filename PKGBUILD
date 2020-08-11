# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=kubeaudit-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="kubeaudit is a command line tool and a Go package to audit Kubernetes clusters for various different security concerns."
arch=('x86_64')
url="https://github.com/Shopify/kubeaudit"
license=('MIT')
source=("https://github.com/Shopify/kubeaudit/releases/download/v${pkgver}/kubeaudit_${pkgver}_linux_amd64.tar.gz")
sha256sums=('08ef3f6797b26be9a7c2f572aa6b0ab771f2ce60dc4c68dfcf1bf6109871c05d')

package() {
	install -d "${pkgdir}/usr/bin"
	install -D -m755 kubeaudit -t "${pkgdir}/usr/bin"
}

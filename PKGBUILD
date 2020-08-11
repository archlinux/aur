# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=kubeaudit-bin
pkgver=0.9.0
pkgrel=4
pkgdesc="kubeaudit is a command line tool and a Go package to audit Kubernetes clusters for various different security concerns."
arch=('x86_64')
url="https://github.com/Shopify/kubeaudit"
license=('MIT')
source=("https://github.com/Shopify/kubeaudit/releases/download/v${pkgver}/kubeaudit_${pkgver}_linux_amd64.tar.gz"
"https://raw.githubusercontent.com/Shopify/kubeaudit/v${pkgver}/LICENSE")
sha256sums=('08ef3f6797b26be9a7c2f572aa6b0ab771f2ce60dc4c68dfcf1bf6109871c05d'
            'c10410d02ed565696f3804b055391354ce279d44392c286fd35754818ea2aa3f')

package() {
	install -D -m755 kubeaudit -t "${pkgdir}/usr/bin"
	install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

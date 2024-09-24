# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=kubeaudit-bin
pkgver=0.22.2
pkgrel=1
pkgdesc="A command line tool and a Go package to audit Kubernetes clusters for various different security concerns."
arch=('x86_64')
conflicts=('kubeaudit')
url="https://github.com/Shopify/kubeaudit"
license=('MIT')
source=("https://github.com/Shopify/kubeaudit/releases/download/v${pkgver}/kubeaudit_${pkgver}_linux_amd64.tar.gz"
"https://raw.githubusercontent.com/Shopify/kubeaudit/v${pkgver}/LICENSE")
sha256sums=('55d5ac82713c6ca0d2186c33d7b99977b6f3965ac5aafeb59fb5d3e1ba6a0d60'
            'c10410d02ed565696f3804b055391354ce279d44392c286fd35754818ea2aa3f')

package() {
	install -D -m755 kubeaudit -t "${pkgdir}/usr/bin"
	install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

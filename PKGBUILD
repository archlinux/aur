# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=kubeaudit-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="kubeaudit is a command line tool and a Go package to audit Kubernetes clusters for various different security concerns."
arch=('x86_64')
conflicts=('kubeaudit')
url="https://github.com/Shopify/kubeaudit"
license=('MIT')
source=("https://github.com/Shopify/kubeaudit/releases/download/${pkgver}/kubeaudit_${pkgver}_linux_amd64.tar.gz"
"https://raw.githubusercontent.com/Shopify/kubeaudit/${pkgver}/LICENSE")
sha256sums=('f8e9fe2c34897edeac44169f9d33fa492b251c595284eddfe9de494a3a0219fe'
            'c10410d02ed565696f3804b055391354ce279d44392c286fd35754818ea2aa3f')

package() {
	install -D -m755 kubeaudit -t "${pkgdir}/usr/bin"
	install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

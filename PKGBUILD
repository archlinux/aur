# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>

pkgname=kubeaudit-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="kubeaudit is a command line tool and a Go package to audit Kubernetes clusters for various different security concerns."
arch=('x86_64')
conflicts=('kubeaudit')
url="https://github.com/Shopify/kubeaudit"
license=('MIT')
source=("https://github.com/Shopify/kubeaudit/releases/download/${pkgver}/kubeaudit_${pkgver}_linux_amd64.tar.gz"
"https://raw.githubusercontent.com/Shopify/kubeaudit/${pkgver}/LICENSE")
sha256sums=('418ba1b3058a34d131ddee85fddeac5ac63a849b399dfcddf18ed3d41db68b5c'
            'c10410d02ed565696f3804b055391354ce279d44392c286fd35754818ea2aa3f')

package() {
	install -D -m755 kubeaudit -t "${pkgdir}/usr/bin"
	install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

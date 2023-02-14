# Maintainer: Zacharias Knudsen <zachasme@gmail.com>

pkgname=aws-iam-authenticator-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/${pkgname%-bin}"
license=('Apache')
provides=("${pkgname%-bin}")
source=("https://github.com/kubernetes-sigs/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64")
sha256sums=("953faf58a5e3653d6355e8f2c35aa4daaafb1c28987708a6c72760f49dc91023")

package() {
	install -D --mode 755 \
		"${srcdir}/${pkgname%-bin}_${pkgver}_linux_amd64" \
		"${pkgdir}/usr/bin/${pkgname%-bin}"
}

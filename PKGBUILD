# Maintainer: Zacharias Knudsen <zachasme@gmail.com>

pkgname=aws-iam-authenticator-bin
pkgver=0.6.14
pkgrel=1
pkgdesc="A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/${pkgname%-bin}"
license=('Apache')
provides=("${pkgname%-bin}")
source=("https://github.com/kubernetes-sigs/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64")
sha256sums=("b2286e24ab852aa5e8e483f6ed5674f58de5fa47f9ae4cbf48a3be9588ac5c7b")

package() {
	install -D --mode 755 \
		"${srcdir}/${pkgname%-bin}_${pkgver}_linux_amd64" \
		"${pkgdir}/usr/bin/${pkgname%-bin}"
}

# Maintainer: Zacharias Knudsen <zachasme@gmail.com>

pkgname=aws-iam-authenticator-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/${pkgname%-bin}"
license=('Apache')
provides=("${pkgname%-bin}")
source=("https://github.com/kubernetes-sigs/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64")
sha256sums=("5720859713002ea3eab8fafa4de3c511690fd018f5aad3e8716b6775ec2e7e26")

package() {
	install -D --mode 755 \
		"${srcdir}/${pkgname%-bin}_${pkgver}_linux_amd64" \
		"${pkgdir}/usr/bin/${pkgname%-bin}"
}

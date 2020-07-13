# Maintainer: Zacharias Knudsen <zachasme@gmail.com>

pkgname=aws-iam-authenticator-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/${pkgname%-bin}"
license=('Apache')
provides=("${pkgname%-bin}")
source=("https://github.com/kubernetes-sigs/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64")
sha256sums=("afb16f35071c977554f1097cbb84ca4f38f9ce42142c8a0612716ae66bb9fdb9")

package() {
	install -Dm 755 "${srcdir}/${pkgname%-bin}_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

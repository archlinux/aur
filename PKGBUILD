# Maintainer: Zacharias Knudsen <zachasme@gmail.com>

pkgname=aws-iam-authenticator-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/aws-iam-authenticator"
license=('Apache')
provides=('aws-iam-authenticator')
source=("https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${pkgver}/heptio-authenticator-aws_${pkgver}_linux_amd64")
noextract=("heptio-authenticator-aws_${pkgver}_linux_amd64")
sha256sums=("4b8ecce88f4749338e361baf1fba9f8970efed0ac3f58cc40b4979bc0d86eb7b")

package() {
	install -Dm 755 "${srcdir}/heptio-authenticator-aws_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/aws-iam-authenticator"
}

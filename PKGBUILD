# Maintainer: Zacharias Knudsen <zachasme@gmail.com>

pkgname=aws-iam-authenticator-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/aws-iam-authenticator"
license=('Apache')
provides=('aws-iam-authenticator')
source=("https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${pkgver}/aws-iam-authenticator_${pkgver}_linux_amd64")
noextract=("heptio-authenticator-aws_${pkgver}_linux_amd64")
sha256sums=("9744923781cca33dba3f48e1b8443af4d7f158748bd105134aaa68252da3b907")

package() {
	install -Dm 755 "${srcdir}/aws-iam-authenticator_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/aws-iam-authenticator"
}

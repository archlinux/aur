# Maintainer: Zacharias Knudsen <zachasme@gmail.com>

pkgname=aws-iam-authenticator-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/aws-iam-authenticator"
license=('Apache')
provides=('aws-iam-authenticator')
source=("https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${pkgver}/aws-iam-authenticator_${pkgver}_linux_amd64")
sha256sums=("4ccb4788d60ed76e3e6a161b56e1e7d91da1fcd82c98f935ca74c0c2fa81b7a6")

package() {
	install -Dm 755 "${srcdir}/aws-iam-authenticator_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/aws-iam-authenticator"
}

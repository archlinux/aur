# Maintainer: Zacharias Knudsen <zachasme@gmail.com>

pkgname=aws-iam-authenticator-bin
pkgver=1.10.3
pkgrel=1
pkgdesc="A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
arch=('x86_64')
url="https://github.com/kubernetes-sigs/aws-iam-authenticator"
license=('Apache')
provides=('aws-iam-authenticator')
source=("https://amazon-eks.s3-us-west-2.amazonaws.com/${pkgver}/2018-07-26/bin/linux/amd64/aws-iam-authenticator")
noextract=("aws-iam-authenticator")
sha256sums=("246f6d13b051bbfb12962edca074c8f67436930e84b2bec3a45a5d9242dc6f0c")

package() {
	install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

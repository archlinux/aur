pkgname=iam-policy-json-to-terraform-bin
pkgver=1.8.2
pkgrel=1
pkgdesc="Small tool to convert an IAM Policy in JSON format into a Terraform aws_iam_policy_document"
arch=('x86_64')
url="https://github.com/flosell/iam-policy-json-to-terraform"
license=('Apache-2.0')
depends=()
makedepends=()
provides=('iam-policy-json-to-terraform-bin')
conflicts=()
source=("https://github.com/flosell/iam-policy-json-to-terraform/releases/download/${pkgver}/iam-policy-json-to-terraform_amd64")
sha256sums=('156250a5a7cef702a233a65155b4e9048f54bce552a6af87208adfc7abb12bcd')

package() {
	cd "${srcdir}"

	install -D -m0755 iam-policy-json-to-terraform_amd64 \
		"${pkgdir}/usr/bin/iam-policy-json-to-terraform"
}

# Maintainer: Debendra Oli <debendraoli@pm.me>

pkgname=iam-policy-json-to-terraform
pkgver=1.8.1
pkgrel=1
pkgdesc="Small tool to convert an IAM Policy in JSON format into a Terraform aws_iam_policy_document"
arch=('x86_64')
url="https://github.com/flosell/iam-policy-json-to-terraform"
license=('Apache License 2.0')
makedepends=()
source=("$url/releases/download/$pkgver/${pkgname}_amd64")
sha256sums=('b148c7cafb050acf255f9da79fed58d5d5acc29f24281b9fd79c8cb50bc55c2f')

package() {
  cd "$srcdir"
  # binary
  install -Dm755 "$srcdir/${pkgname}_amd64" "$pkgdir/usr/bin/$pkgname"
}

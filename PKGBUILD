# Maintainer: Debendra Oli <debendraoli@pm.me>

pkgname=iam-policy-json-to-terraform
pkgver=1.9.2
pkgrel=1
pkgdesc="Small tool to convert an IAM Policy in JSON format into a Terraform aws_iam_policy_document"
arch=('x86_64')
url="https://github.com/flosell/iam-policy-json-to-terraform"
license=('Apache License 2.0')
makedepends=()
source=("$url/releases/download/$pkgver/${pkgname}_amd64")
sha256sums=('38db59de1a89308bd297e008393d92cb2b9a29e75401d5fc554115697ca83066')

package() {
  cd "$srcdir"
  # binary
  install -Dm755 "$srcdir/${pkgname}_amd64" "$pkgdir/usr/bin/$pkgname"
}

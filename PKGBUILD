# Maintainer: Edmundo Sanchez <zomundo at gmail dot com>
pkgname=terraform-bin
pkgbase=terraform-bin
pkgver=1.12.1
pkgrel=1.0
pkgdesc='HashiCorp tool for building and updating infrastructure as code
    idempotently'
arch=('x86_64')
url='https://www.terraform.io'
license=('BSL')
depends=()
source=(
    "https://releases.hashicorp.com/terraform/${pkgver}/terraform_${pkgver}_linux_amd64.zip"
)
sha256sums=('dcaf8ba801660a431a6769ec44ba53b66c1ad44637512ef3961f7ffe4397ef7c')
replaces=('terraform')

package() {
    install -D -g root -m 0755 -o root "$srcdir/terraform" "$pkgdir/usr/bin/terraform"
}


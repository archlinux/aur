# Maintainer: Edmundo Sanchez <zomundo at gmail dot com>
pkgname=terraform-bin
pkgbase=terraform-bin
pkgver=1.15.6
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
sha256sums=('a7150d3b0e1b5c466ad42e8c499954a3c54645f8b56b385fa025d34f7e88faa9')
replaces=('terraform')

package() {
    install -D -g root -m 0755 -o root "$srcdir/terraform" "$pkgdir/usr/bin/terraform"
}

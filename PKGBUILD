# Maintainer: Edmundo Sanchez <zomundo at gmail dot com>
pkgname=terraform-bin
pkgbase=terraform-bin
pkgver=1.9.6
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
sha256sums=('f2c90fb1efb2ad411519d1d3ccbaee7489a60e3147f2206fdb824fb35fac9c1c')
replaces=('terraform')

package() {
    install -D -g root -m 0755 -o root "$srcdir/terraform" "$pkgdir/usr/bin/terraform"
}


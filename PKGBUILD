# Maintainer: Edmundo Sanchez <zomundo at gmail dot com>
pkgname=terraform-bin
pkgbase=terraform-bin
pkgver=1.10.4
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
sha256sums=('64b7b60f35eb92e94a046b6c932ce53f632a9eb528e9d0097857f9f27420be3e')
replaces=('terraform')

package() {
    install -D -g root -m 0755 -o root "$srcdir/terraform" "$pkgdir/usr/bin/terraform"
}


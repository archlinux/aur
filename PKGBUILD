# Maintainer: Edmundo Sanchez <zomundo at gmail dot com>
pkgname=terraform-bin
pkgbase=terraform-bin
pkgver=1.8.1
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
sha256sums=('265d28a1a6dd81bdd5822eba55663613b7a51c582d663f9417f8777905d39002')
replaces=('terraform')

package() {
    install -D -g root -m 0755 -o root "$srcdir/terraform" "$pkgdir/usr/bin/terraform"
}


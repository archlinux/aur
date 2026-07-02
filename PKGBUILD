# Maintainer: Jonathan Wright <jon@than.io>
# Contributors: David Rodriguez <dissonant.tech@gmail.com>

pkgname=terraform-ls-bin
pkgver=0.38.8
pkgrel=1
pkgdesc="Terraform Language Server"
arch=('x86_64')
pkgurl="https://releases.hashicorp.com/terraform-ls"
license=('MPL2')
makedepends=()
optdepends=('terraform: Required to support fmt command')

source=("terraform-ls-linux-amd64-${pkgver}.zip::${pkgurl}/${pkgver}/terraform-ls_${pkgver}_linux_amd64.zip")
sha512sums=('f8a880dd1061d053ae5875586ef075c6e97118a132a982f079b2532ec96642f8076423066332827dc0334d65267a3addd0b4aae1e94ab8e627f2972ad85a3be1')

package() {
  install -D -g root -m 0755 -o root "$srcdir/terraform-ls" "$pkgdir/usr/bin/terraform-ls"
}

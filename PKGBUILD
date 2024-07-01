# Maintainer: Jonathan Wright <jon@than.io>
# Contributors: David Rodriguez <dissonant.tech@gmail.com>

pkgname=terraform-ls-bin
pkgver=0.33.3
pkgrel=1
pkgdesc="Terraform Language Server"
arch=('x86_64')
pkgurl="https://releases.hashicorp.com/terraform-ls"
license=('MPL2')
makedepends=()
optdepends=('terraform: Required to support fmt command')

source=("terraform-ls-linux-amd64-${pkgver}.zip::${pkgurl}/${pkgver}/terraform-ls_${pkgver}_linux_amd64.zip")
sha512sums=('990ff385525ecf864fbe46fede8cb27da47bf3e8f76cc6422d74658cdedd5846072e04fae04dbf66f16767a1df12f6f63b158d912bf7bc37bfc62817214cd4c8')

package() {
  install -D -g root -m 0755 -o root "$srcdir/terraform-ls" "$pkgdir/usr/bin/terraform-ls"
}

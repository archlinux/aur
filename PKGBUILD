# Maintainer: Jonathan Wright <jon@than.io>
# Contributors: David Rodriguez <dissonant.tech@gmail.com>

pkgname=terraform-ls-bin
pkgver=0.34.1
pkgrel=1
pkgdesc="Terraform Language Server"
arch=('x86_64')
pkgurl="https://releases.hashicorp.com/terraform-ls"
license=('MPL2')
makedepends=()
optdepends=('terraform: Required to support fmt command')

source=("terraform-ls-linux-amd64-${pkgver}.zip::${pkgurl}/${pkgver}/terraform-ls_${pkgver}_linux_amd64.zip")
sha512sums=('3847a75c693702480970012b5ffd020cf963299e89f9502e0470f34854869770e4317f56c548fe972c3a6085a5fff5d65f92d5e4effbe999ff1023d6e1fd0110')

package() {
  install -D -g root -m 0755 -o root "$srcdir/terraform-ls" "$pkgdir/usr/bin/terraform-ls"
}

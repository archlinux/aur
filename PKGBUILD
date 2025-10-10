# Maintainer: Jonathan Wright <jon@than.io>
# Contributors: David Rodriguez <dissonant.tech@gmail.com>

pkgname=terraform-ls-bin
pkgver=0.38.2
pkgrel=1
pkgdesc="Terraform Language Server"
arch=('x86_64')
pkgurl="https://releases.hashicorp.com/terraform-ls"
license=('MPL2')
makedepends=()
optdepends=('terraform: Required to support fmt command')

source=("terraform-ls-linux-amd64-${pkgver}.zip::${pkgurl}/${pkgver}/terraform-ls_${pkgver}_linux_amd64.zip")
sha512sums=('201b387415fe3ba626be49fb0e381c365eb65d449a16982dca3204ab3dbe9a4fc703be97d01ffb0923434e843af129ef0417e4240e7193520cc3a946594fd55e')

package() {
  install -D -g root -m 0755 -o root "$srcdir/terraform-ls" "$pkgdir/usr/bin/terraform-ls"
}

# Maintainer: Jonathan Wright <jon@than.io>
# Contributors: David Rodriguez <dissonant.tech@gmail.com>

pkgname=terraform-ls-bin
pkgver=0.29.1
pkgrel=1
pkgdesc="Terraform Language Server"
arch=('x86_64')
url="https://github.com/hashicorp/terraform-ls"
license=('MPL2')
makedepends=('unzip')

source=("terraform-ls-linux-amd64-${pkgver}.zip::${url}/releases/download/v${pkgver}/terraform-ls_${pkgver}_linux_amd64.zip")
sha512sums=('64e19c70dce213af4c94e37c2492cca5d062fee82713a8f469d1b04b3608c5b6752cfc90156b140f7eab3077a686422c1e003e16e5961b293ecd20e24f3b63be')

package() {
	install -D -g root -m 0755 -o root "$srcdir/terraform-ls" "$pkgdir/usr/bin/terraform-ls"
}

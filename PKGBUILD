# Maintainer: Jonathan Wright <jon@than.io>
# Contributors: David Rodriguez <dissonant.tech@gmail.com>

pkgname=terraform-ls-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Terraform Language Server"
arch=('x86_64')
url="https://github.com/hashicorp/terraform-ls"
license=('MPL2')
makedepends=('unzip')

source=("terraform-ls-linux-amd64-${pkgver}::${url}/releases/download/v${pkgver}/terraform-ls_${pkgver}_linux_amd64.zip")
sha512sums=('28dcc82dae4b01ffc797365ed621e9d330ba7aaa1fa250ba8c3e0abdfdab98bf364919caf26c687770d469f4e7c2090d80fbe4a4623d1b369e0244cbacef2e2c')

package() {
	install -D -g root -m 0755 -o root "$srcdir/terraform-ls" "$pkgdir/usr/bin/terraform-ls"
}

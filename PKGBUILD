# Maintainer: Jonathan Wright <jon@than.io>
# Contributors: David Rodriguez <dissonant.tech@gmail.com>

pkgname=terraform-ls-bin
pkgver=0.29.0
pkgrel=1
pkgdesc="Terraform Language Server"
arch=('x86_64')
url="https://github.com/hashicorp/terraform-ls"
license=('MPL2')
makedepends=('unzip')

source=("terraform-ls-linux-amd64-${pkgver}.zip::${url}/releases/download/v${pkgver}/terraform-ls_${pkgver}_linux_amd64.zip")
sha512sums=('30cd674862bfd737e2900198ab3491d2a3e8e00a91d67ce26b582b39b118912a9d7c5394e50d5354f287479b26163d13bdd6e08e47bf9dd83a02f9078eed0c7a')

package() {
	install -D -g root -m 0755 -o root "$srcdir/terraform-ls" "$pkgdir/usr/bin/terraform-ls"
}

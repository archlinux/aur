# Maintainer: Jonathan Wright <jon@than.io>
# Contributors: David Rodriguez <dissonant.tech@gmail.com>

pkgname=terraform-ls-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Terraform Language Server"
arch=('x86_64')
url="https://github.com/hashicorp/terraform-ls"
license=('MPL2')
makedepends=('unzip')

source=("terraform-ls-linux-amd64-${pkgver}::${url}/releases/download/v${pkgver}/terraform-ls_${pkgver}_linux_amd64.zip")
sha512sums=('5959e766b172fbe717a87234f7cdb50b0eece6155fd2403ca025eb44dc60ffa807dbe32eb8ee13a121cd252ca32a61a21eecac5692dc2b05c00fed8e7f1d04ac')

package() {
	install -D -g root -m 0755 -o root "$srcdir/terraform-ls" "$pkgdir/usr/bin/terraform-ls"
}

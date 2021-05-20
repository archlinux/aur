# Maintainer: Jonathan Wright <jon@than.io>
# Contributors: David Rodriguez <dissonant.tech@gmail.com>

pkgname=terraform-ls-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Terraform Language Server"
arch=('x86_64')
url="https://github.com/hashicorp/terraform-ls"
license=('MPL2')
makedepends=('unzip')

source=("terraform-ls-linux-amd64-${pkgver}::${url}/releases/download/v${pkgver}/terraform-ls_${pkgver}_linux_amd64.zip")
sha512sums=('ce4fca36e6d558f83b8dbcd747c6772a81dfde5b778ae740c722e0e8652a84ea4f9fe83ba77e1ca83a5041d7a86c2267ff2863d6ddb44f39eef3d3942ff3d7de')

package() {
	install -D -g root -m 0755 -o root "$srcdir/terraform-ls" "$pkgdir/usr/bin/terraform-ls"
}

# Maintainer: Jonathan Wright <jon@than.io>
# Contributors: David Rodriguez <dissonant.tech@gmail.com>

pkgname=terraform-ls-bin
pkgver=0.31.5
pkgrel=1
pkgdesc="Terraform Language Server"
arch=('x86_64')
pkgurl="https://releases.hashicorp.com/terraform-ls"
license=('MPL2')
makedepends=('unzip' 'bc')
optdepends=('terraform: Required to support fmt command')

source=("terraform-ls-linux-amd64-${pkgver}.zip::${pkgurl}/${pkgver}/terraform-ls_${pkgver}_linux_amd64.zip")
sha512sums=('f5fc6694fdc563ae673e1558026a928bb4e0e1ad9d45005eca16d108e9401ec7a0a289b4cbb1cd9c6f7a774b8b02c9f5c2c5f04938452f4ac7879e5ea264337c')

package() {
	install -D -g root -m 0755 -o root "$srcdir/terraform-ls" "$pkgdir/usr/bin/terraform-ls"
}

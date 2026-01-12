# Maintainer: futpib <futpib@gmail.com>

pkgname=acli-bin
pkgver=1.3.9
pkgrel=1
pkgdesc="Software to interact with Atlassian Cloud from the terminal"
arch=('x86_64')
url="https://developer.atlassian.com/cloud/acli/"
license=('custom')
provides=('acli')
conflicts=('acli')

source_x86_64=("https://acli.atlassian.com/linux/${pkgver}-stable/acli_${pkgver}-stable_linux_amd64.tar.gz")

sha256sums_x86_64=('3cfc9fa3bbcb1ebf9c2a14574874a9f3f9dec8d2db561415f914c9bd70656de7')

package() {
	install -Dm755 "acli_${pkgver}-stable_linux_amd64/acli" "$pkgdir/usr/bin/acli"
}

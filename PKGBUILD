# Maintainer: futpib <futpib@gmail.com>

pkgname=acli-bin
pkgver=1.3.16
pkgrel=1
pkgdesc="Software to interact with Atlassian Cloud from the terminal"
arch=('x86_64')
url="https://developer.atlassian.com/cloud/acli/"
license=('custom')
provides=('acli')
conflicts=('acli')

source_x86_64=("https://acli.atlassian.com/linux/${pkgver}-stable/acli_${pkgver}-stable_linux_amd64.tar.gz")

sha256sums_x86_64=('3c4481a6b444745c66fe8c5f9d8453dbc096282cbeaa49a344a7c5b387b4c3c4')

package() {
  install -Dm755 "acli_${pkgver}-stable_linux_amd64/acli" "$pkgdir/usr/bin/acli"
}

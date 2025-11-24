# Maintainer: futpib <futpib@gmail.com>

pkgname=acli-bin
pkgver=1.3.6
pkgrel=1
pkgdesc="Software to interact with Atlassian Cloud from the terminal"
arch=('x86_64')
url="https://developer.atlassian.com/cloud/acli/"
license=('custom')
provides=('acli')
conflicts=('acli')

source_x86_64=("https://acli.atlassian.com/linux/${pkgver}-stable/acli_${pkgver}-stable_linux_amd64.tar.gz")

sha256sums_x86_64=('e7462a290d86c481c6620f9b6a70c2cdd81685a406b644ce84af7a1c0b20bce6')

package() {
  install -Dm755 "acli_${pkgver}-stable_linux_amd64/acli" "$pkgdir/usr/bin/acli"
}

# Maintainer: futpib <futpib@gmail.com>

pkgname=acli-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Software to interact with Atlassian Cloud from the terminal"
arch=('x86_64')
url="https://developer.atlassian.com/cloud/acli/"
license=('custom')
provides=('acli')
conflicts=('acli')

source_x86_64=("https://acli.atlassian.com/linux/${pkgver}-stable/acli_${pkgver}-stable_linux_amd64.tar.gz")

sha256sums_x86_64=('1f51eb080d4e19776ab852fa963e63e27d7bc7e3a2f5e027c4bf6665b963e7e4')

package() {
    install -Dm755 "acli_${pkgver}-stable_linux_amd64/acli" "$pkgdir/usr/bin/acli"
}

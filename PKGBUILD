# Maintainer: futpib <futpib@gmail.com>

pkgname=acli-bin
pkgver=1.3.11
pkgrel=1
pkgdesc="Software to interact with Atlassian Cloud from the terminal"
arch=('x86_64')
url="https://developer.atlassian.com/cloud/acli/"
license=('custom')
provides=('acli')
conflicts=('acli')

source_x86_64=("https://acli.atlassian.com/linux/${pkgver}-stable/acli_${pkgver}-stable_linux_amd64.tar.gz")

sha256sums_x86_64=('50bb48e965e48531e008923be763a7b1f74fe9e2e33cc02cd2aaf5e2f00c6dc4')

package() {
  install -Dm755 "acli_${pkgver}-stable_linux_amd64/acli" "$pkgdir/usr/bin/acli"
}

# Maintainer: futpib <futpib@gmail.com>

pkgname=acli-bin
pkgver=1.3.7
pkgrel=1
pkgdesc="Software to interact with Atlassian Cloud from the terminal"
arch=('x86_64')
url="https://developer.atlassian.com/cloud/acli/"
license=('custom')
provides=('acli')
conflicts=('acli')

source_x86_64=("https://acli.atlassian.com/linux/${pkgver}-stable/acli_${pkgver}-stable_linux_amd64.tar.gz")

sha256sums_x86_64=('43c54b31f5def20cf0f29af9f8987c8b6180d6a875b26e129e11179b8b0d2654')

package() {
  install -Dm755 "acli_${pkgver}-stable_linux_amd64/acli" "$pkgdir/usr/bin/acli"
}

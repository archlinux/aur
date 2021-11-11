# Maintainer: jbpratt <jbpratt78 at gmail dot com>

pkgname=src-cli-bin
pkgver=3.33.6
pkgrel=1
pkgdesc="A command line interface to Sourcegraph"
url="https://github.com/sourcegraph/src-cli"
arch=("x86_64" "aarch64")
license=("APACHE")

source_x86_64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_aarch64.tar.gz")

sha256sums_x86_64=("9c633603d098159f5fb0257bff98a9ad5249cd073c779f430643f98e22101ce2")
sha256sums_aarch64=("462ae955646b640f67c741ca7e5a5439728b89da67b37b212235909a5f294988")

package() {
  install -Dm755 "${srcdir}/src" "${pkgdir}/usr/bin/src"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

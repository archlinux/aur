# Maintainer: jbpratt <jbpratt78 at gmail dot com>

pkgname=src-cli-bin
pkgver=3.34.1
pkgrel=1
pkgdesc="A command line interface to Sourcegraph"
url="https://github.com/sourcegraph/src-cli"
arch=("x86_64" "aarch64")
license=("APACHE")

source_x86_64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_aarch64.tar.gz")

sha256sums_x86_64=("94028039bb37f75f510eea3602029758bd7240265d1a746818a5d94a802cc433")
sha256sums_aarch64=("a0a4cbb34756976ad697f7ba1267f21e85ab3f1b4c8d21925b2c8ff78520a378")

package() {
  install -Dm755 "${srcdir}/src" "${pkgdir}/usr/bin/src"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: jbpratt <jbpratt78 at gmail dot com>

pkgname=src-cli-bin
pkgver=3.36.4
pkgrel=1
pkgdesc="A command line interface to Sourcegraph"
url="https://github.com/sourcegraph/src-cli"
arch=("x86_64" "aarch64")
license=("APACHE")

source_x86_64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_aarch64.tar.gz")

sha256sums_x86_64=("8c71b4d04e876eb7cf6928dc111c6fa72a415f8c1fe857f78ae331fb40145d05")
sha256sums_aarch64=("b3e5f456a525a7b73edb42c580bbf541be6018573acb6171096d9942cfb207ae")

package() {
  install -Dm755 "${srcdir}/src" "${pkgdir}/usr/bin/src"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

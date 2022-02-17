# Maintainer: jbpratt <jbpratt78 at gmail dot com>

pkgname=src-cli-bin
pkgver=3.37.0
pkgrel=2
pkgdesc="A command line interface to Sourcegraph"
url="https://github.com/sourcegraph/src-cli"
arch=("x86_64" "aarch64")
license=("APACHE")
provides=('src-cli')
conflicts=('src-cli')

source_x86_64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_aarch64.tar.gz")

sha256sums_x86_64=("eb1e8880b3a6c3dbbdb4514249947fb4ed7969b530113b6b782644ffb99ab6df")
sha256sums_aarch64=("179349778dd6cdf63c137ef05f97a3d3aaaf62f6b671eac19103f8bb7a854918")

package() {
  install -Dm755 "${srcdir}/src" "${pkgdir}/usr/bin/src"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

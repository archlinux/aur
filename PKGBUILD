# Maintainer: jbpratt <jbpratt78 at gmail dot com>

pkgname=src-cli-bin
pkgver=3.43.2
pkgrel=1
pkgdesc="A command line interface to Sourcegraph"
url="https://github.com/sourcegraph/src-cli"
arch=("x86_64" "aarch64")
license=("APACHE")
provides=('src-cli')
conflicts=('src-cli')

source_x86_64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_aarch64.tar.gz")

sha256sums_x86_64=("e7d954053bf64a2508f18e350faf98ead56a21f493fe40177d558f4bfc406505")
sha256sums_aarch64=("ebd0526ed4a6313a8b3811c5d7ad3f34b26b46090693a9c35ae344c0bee43129")

package() {
  install -Dm755 "${srcdir}/src" "${pkgdir}/usr/bin/src"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

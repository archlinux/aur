# Maintainer: Emanuel Bennici <emanuel at l0nax dot org>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=src-cli-bin
pkgver=6.10.0
pkgrel=1
pkgdesc="A command line interface to Sourcegraph"
url="https://github.com/sourcegraph/src-cli"
arch=('x86_64' 'aarch64')
license=('APACHE')
provides=('src-cli')
conflicts=('sourcegraph-cli')

source_x86_64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/sourcegraph/src-cli/releases/download/${pkgver}/src-cli_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('1193334ecf2506d230dd2b1a451ceb4563ca9fd8a0257b45ea2ac9dbf5a300be')
sha256sums_aarch64=('04b33fc92421266197a75afe6b88ee1e62ab744dda757057941d09b87ab85fcb')

package() {
  install -Dm755 "${srcdir}/src" "${pkgdir}/usr/bin/src"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

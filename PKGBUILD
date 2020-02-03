# Maintainer: Brendan Weibrecht (ZimbiX) <brendan@weibrecht.net.au>

# Any feedback welcome! =)

pkgname=github-cli-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="The official GitHub CLI"
arch=('x86_64')
url=https://github.com/cli/cli
license=('MIT')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/gh_${pkgver}_linux_amd64.tar.gz")
sha256sums=('f74f1eeb3aabbe03ed6eb945b0de797775cd9f473a94b43f996bad103c7488d2')

package() {
  install -Dm755 "${srcdir}/gh_${pkgver}_linux_amd64/bin/gh" "${pkgdir}/usr/bin/gh"
  install -Dm655 "${srcdir}/gh_${pkgver}_linux_amd64/LICENSE" -t "${pkgdir}/usr/share/licenses/github-cli"
}

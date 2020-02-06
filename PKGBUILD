# Maintainer: Brendan Weibrecht (ZimbiX) <brendan@weibrecht.net.au>

# Any feedback welcome! =)

pkgname=github-cli-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="The official GitHub CLI - binary"
arch=('x86_64')
url=https://github.com/cli/cli
license=('MIT')
depends=('glibc')
provides=('github-cli')
conflicts=('github-cli')
source=("${url}/releases/download/v${pkgver}/gh_${pkgver}_linux_amd64.tar.gz")
sha256sums=('b6725efd3b4ce8ea0d882c0b7519bd6122e950772b85528e8b84771a22880249')

package() {
  install -Dm755 "${srcdir}/gh_${pkgver}_linux_amd64/bin/gh" "${pkgdir}/usr/bin/gh"
  install -Dm644 "${srcdir}/gh_${pkgver}_linux_amd64/LICENSE" -t "${pkgdir}/usr/share/licenses/github-cli-bin"
}

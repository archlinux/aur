# Maintainer: Brendan Weibrecht (ZimbiX) <brendan@weibrecht.net.au>

# Any feedback welcome! =)

pkgname=github-cli-bin
pkgver=0.5.7
pkgrel=1
pkgdesc="The official GitHub CLI - binary"
arch=('x86_64')
url=https://github.com/cli/cli
license=('MIT')
depends=('glibc')
provides=('github-cli')
conflicts=('github-cli')
source=("${url}/releases/download/v${pkgver}/gh_${pkgver}_linux_amd64.tar.gz")
sha256sums=('0cbaa7c4e8a84a92c8e6244daaa82076bd1072a70506955491066bc693ba33f8')

package() {
  install -Dm755 "${srcdir}/gh_${pkgver}_linux_amd64/bin/gh" "${pkgdir}/usr/bin/gh"
  install -Dm644 "${srcdir}/gh_${pkgver}_linux_amd64/LICENSE" -t "${pkgdir}/usr/share/licenses/github-cli-bin"
}

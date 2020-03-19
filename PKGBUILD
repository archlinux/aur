# Maintainer: Brendan Weibrecht (ZimbiX) <brendan@weibrecht.net.au>

# Any feedback welcome! =)

pkgname=github-cli-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="The official GitHub CLI - binary"
arch=('x86_64')
url=https://github.com/cli/cli
license=('MIT')
depends=('glibc')
provides=('github-cli')
conflicts=('github-cli')
source=("${url}/releases/download/v${pkgver}/gh_${pkgver}_linux_amd64.tar.gz")
sha256sums=('47f30a211953839b5d2ff4bee88427091f8f0dda5fd563c47b244b69cb01e92b')

package() {
  install -Dm755 "${srcdir}/gh_${pkgver}_linux_amd64/bin/gh" "${pkgdir}/usr/bin/gh"
  install -Dm644 "${srcdir}/gh_${pkgver}_linux_amd64/LICENSE" -t "${pkgdir}/usr/share/licenses/github-cli-bin"
}

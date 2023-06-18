# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=tmex
pkgver=1.0.10
pkgrel=1
pkgdesc="minimalist tmux layout manager"
arch=('i686' 'x86_64')
license=('MIT')
depends=('bash' 'tmux')
url="https://github.com/evnp/tmex"

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('89c9aeb884c3742322aacbfcfcf85e971d9c1e25a98558b95fe26c1dc349e7f9')

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 tmex "${pkgdir}/usr/bin/tmex"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

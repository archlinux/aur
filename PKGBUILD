# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=tmex
pkgver=1.0.9
pkgrel=1
pkgdesc="minimalist tmux layout manager"
arch=('i686' 'x86_64')
license=('MIT')
depends=('bash' 'tmux')
url="https://github.com/evnp/tmex"

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('7a731007c67dabff285b21b75c135bfd46fa0c40e43d5268246236eedaf1350e')

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 tmex "${pkgdir}/usr/bin/tmex"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

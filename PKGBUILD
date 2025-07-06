# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=tmex
pkgver=2.0.5
pkgrel=1
pkgdesc="minimalist tmux layout manager"
arch=('i686' 'x86_64')
license=('MIT')
depends=('bash' 'tmux')
url="https://github.com/evnp/tmex"

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('7d10effd81f904689a09c82cd5d8f3f078fcc58fe5535e8c7a35658e84e33323')

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 tmex "${pkgdir}/usr/bin/tmex"
  install -Dm644 man/tmex.1 "${pkgdir}/usr/share/man/man1/tmex.1"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

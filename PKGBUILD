# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=tmex
pkgver=2.0.2
pkgrel=1
pkgdesc="minimalist tmux layout manager"
arch=('i686' 'x86_64')
license=('MIT')
depends=('bash' 'tmux')
url="https://github.com/evnp/tmex"

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('1f9ec6f06c6dddb81311576a985c743a65f0eb9bce48d9eac3cbac9f9eb0e211')

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 tmex "${pkgdir}/usr/bin/tmex"
  install -Dm644 man/tmex.1 "${pkgdir}/usr/share/man/man1/tmex.1"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgname=yoo-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="A tiny developer companion for better coding sessions"
arch=('x86_64')
url="https://github.com/nihitdev/yo-cli"
license=('GPL-3.0-or-later')

provides=('yoo')
conflicts=('yoo')

source=(
  "https://github.com/nihitdev/yo-cli/releases/download/v${pkgver}/yoo-v${pkgver}-linux-x86_64.tar.gz"
)

sha256sums=(
  'bfad4458e57946b3403f76f675f350e1dd0f27aa0c9c16de51104a2c04d606d1'
)

package() {
  install -Dm755 \
    "${srcdir}/yoo-v${pkgver}-linux-x86_64/yoo" \
    "${pkgdir}/usr/bin/yoo"

  install -Dm644 \
    "${srcdir}/yoo-v${pkgver}-linux-x86_64/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 \
    "${srcdir}/yoo-v${pkgver}-linux-x86_64/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

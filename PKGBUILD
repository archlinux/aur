pkgname=dumpr-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='Turn a project directory into a readable text dump (prebuilt binary)'
arch=('x86_64')
url='https://github.com/iktrnch/dumpr'
license=('MIT')
depends=('gcc-libs')
provides=('dumpr')
conflicts=('dumpr')
source=("dumpr-${pkgver}-x86_64.tar.gz::https://github.com/iktrnch/dumpr/releases/download/v1.0.2/dumpr-1.0.2-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('c2b2d4ec67c4d730a1bf4ec9e170e695c870c6a0da67816858beeed5e78a613e')

package() {
  install -Dm755 "${srcdir}/dumpr-${pkgver}-x86_64-unknown-linux-musl/dumpr" "${pkgdir}/usr/bin/dumpr"
  install -Dm644 "${srcdir}/dumpr-${pkgver}-x86_64-unknown-linux-musl/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/dumpr-${pkgver}-x86_64-unknown-linux-musl/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

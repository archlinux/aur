pkgname=dumpr-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='Turn a project directory into a readable text dump (prebuilt binary)'
arch=('x86_64')
url='https://github.com/iktrnch/dumpr'
license=('MIT')
depends=('gcc-libs')
provides=('dumpr')
conflicts=('dumpr')
source=("dumpr-${pkgver}-x86_64.tar.gz::https://github.com/iktrnch/dumpr/releases/download/v1.0.3/dumpr-1.0.3-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('5d764365d7bf06e3e3246d507495fb48e26dedec998f2d6f6862541b3f5403d1')

package() {
  install -Dm755 "${srcdir}/dumpr-${pkgver}-x86_64-unknown-linux-musl/dumpr" "${pkgdir}/usr/bin/dumpr"
  install -Dm644 "${srcdir}/dumpr-${pkgver}-x86_64-unknown-linux-musl/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/dumpr-${pkgver}-x86_64-unknown-linux-musl/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

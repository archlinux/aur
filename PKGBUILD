# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=sqlc-bin
pkgver=1.5.0
pkgrel=2
pkgdesc='Generate type safe Go from SQL'
arch=('x86_64')
url="https://github.com/kyleconroy/sqlc"
license=('MIT')
source=(
  "https://github.com/kyleconroy/sqlc/releases/download/v${pkgver}/sqlc-v${pkgver}-linux-amd64.tar.gz"
  "https://raw.githubusercontent.com/kyleconroy/sqlc/d191365b0af92dead317a87633bd666c3bd20f6c/LICENSE"
)
sha256sums=('ce9cb631489b81fa979bec0de93506eb894c65e03694173478a158c4d7115a7e'
            'b18ed0937de93cf24dd372fe1b59ba578d183588ed087cc63772930b80ce57aa')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "${srcdir}/sqlc" "${pkgdir}/usr/bin/sqlc"
}


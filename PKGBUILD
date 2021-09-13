# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=sqlc-bin
pkgver=1.10.0
pkgrel=1
pkgdesc='Generate type safe Go from SQL'
arch=('x86_64')
url="https://github.com/kyleconroy/sqlc"
license=('MIT')
source=(
  "https://github.com/kyleconroy/sqlc/releases/download/v${pkgver}/sqlc_${pkgver}_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/kyleconroy/sqlc/v${pkgver}/LICENSE"
)
sha256sums=('5d3d1203acb3df6a79d58a53a498e1757ed406e5f6d9e11283f3f8d3cff39050'
            'b18ed0937de93cf24dd372fe1b59ba578d183588ed087cc63772930b80ce57aa')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "${srcdir}/sqlc" "${pkgdir}/usr/bin/sqlc"
}


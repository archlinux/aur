# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=sqlc-bin
pkgver=1.8.0
pkgrel=1
pkgdesc='Generate type safe Go from SQL'
arch=('x86_64')
url="https://github.com/kyleconroy/sqlc"
license=('MIT')
source=(
  "https://github.com/kyleconroy/sqlc/releases/download/v${pkgver}/sqlc-v${pkgver}-linux-amd64.tar.gz"
  "https://raw.githubusercontent.com/kyleconroy/sqlc/v${pkgver}/LICENSE"
)
sha256sums=('8de814858711b7d7c0a9c957f053da1f2a7155d379a79bec95c7c9d19da9d1a2'
            'b18ed0937de93cf24dd372fe1b59ba578d183588ed087cc63772930b80ce57aa')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "${srcdir}/sqlc" "${pkgdir}/usr/bin/sqlc"
}


# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgname=topiary-bin
pkgver=0.7.2
pkgrel=1
pkgdesc='Topiary is a tool in the Tree-sitter ecosystem, designed for formatter authors and formatter users'
url='https://github.com/tweag/topiary'
arch=(x86_64 aarch64)
license=(MIT)
provides=(topiary)
conflicts=(topiary)
source_x86_64=("https://github.com/tweag/topiary/releases/download/v${pkgver}/topiary-cli-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/tweag/topiary/releases/download/v${pkgver}/topiary-cli-aarch64-unknown-linux-gnu.tar.xz")
sha512sums_x86_64=('beb8c23d7c0103ec90e644ac56dc7441e3d57b1c3e3a150f95151b00ecdb3aac9e7ae7cf7e31943f8a286e557e9b73c7e3f99828b6def11b981610b5526394d9')
sha512sums_aarch64=('204b1aa0257dfb426b07bc3c11a79f29b96419ddca8a4d7b050dd2207716775cdfadd8d335d16d86e47b666c86968d5aafedfbe15b9bfc3caa18e445882d4fc1')

package() {
  install -Dm 755 \
    "${srcdir}/topiary-cli-${CARCH}-unknown-linux-gnu/topiary" \
    "${pkgdir}/usr/local/bin/topiary"
}

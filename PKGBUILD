# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgname=topiary-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='Topiary is a tool in the Tree-sitter ecosystem, designed for formatter authors and formatter users'
url='https://github.com/tweag/topiary'
arch=(x86_64 aarch64)
license=(MIT)
provides=(topiary)
conflicts=(topiary)
source_x86_64=("https://github.com/tweag/topiary/releases/download/v${pkgver}/topiary-cli-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://github.com/tweag/topiary/releases/download/v${pkgver}/topiary-cli-aarch64-unknown-linux-gnu.tar.xz")
sha512sums_x86_64=('7926e8caccfd497aee2a430f76c558c6e7a18594c8c56ecca2661701ae3a3c924bbd8b468fa00d8c7b307efb3f279e765ae6d320ac5103c4c59016cc15fbe3de')
sha512sums_aarch64=('e4001e3e5c09b0ffe174cb30a3d7e198050a23ee46c6ad723f909b35fda2dd774b4eed109a9ef6a7f29c1b87a1199668df79b076ee53824ba9d55e8e9ce01364')

package() {
  install -Dm 755 \
    "${srcdir}/topiary-cli-${CARCH}-unknown-linux-gnu/topiary" \
    "${pkgdir}/usr/local/bin/topiary"
}

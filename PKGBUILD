# Maintainer: Cleboost <clement.balarot@gmail.com> (missing-aur project)
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=temper-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A stupidly fast open-source Minecraft server, written in Rust (binary version)"
arch=('x86_64' 'aarch64')
url="https://github.com/temper-mc/temper"
license=('GPL3')
conflicts=("temper")
provides=("temper")
options=(!strip)

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/temper-mc/temper/releases/download/v${pkgver}/temper-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/temper-mc/temper/releases/download/v${pkgver}/temper-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('49422315bb551e6c4b560a39eb5a8027566ce8479fa6d3ece59051854a4f6219')
sha256sums_aarch64=('760fd37e1cfafafd1dc06e2b2e1e9a8a8ea8b7d2f451852ef4f674337be5c334')

package() {
    install -Dm755 "${srcdir}/temper" "${pkgdir}/usr/bin/temper"
}

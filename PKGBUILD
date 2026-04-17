pkgname=seestar-tool
pkgver=2026.4.2
pkgrel=1
pkgdesc="Desktop tool for managing firmware on ZWO Seestar telescopes"
arch=('x86_64' 'aarch64')
url="https://github.com/bguthro/seestar-tool"
license=('GPL-3.0')
depends=()
source=()
sha256sums=()
source_x86_64=('https://github.com/bguthro/seestar-tool/releases/download/v2026.4.2/seestar-tool_2026.4.2_amd64.deb')
sha256sums_x86_64=('ac04f2d8d415a75e219e0215218730e26e21b030e0866d90dd579aed4ca50502')
source_aarch64=('https://github.com/bguthro/seestar-tool/releases/download/v2026.4.2/seestar-tool_2026.4.2_arm64.deb')
sha256sums_aarch64=('d6ac724d08c658e9f9492616133cae5ae7d610e0053b49917ef69d2671a4a71d')

package() {
    tar -xf "${srcdir}/data.tar.zst" -C "$pkgdir/"
    chmod 755 "$pkgdir/usr"
}

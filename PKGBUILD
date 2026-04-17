pkgname=seestar-tool
pkgver=2026.4.6
pkgrel=1
pkgdesc="Desktop tool for managing firmware on ZWO Seestar telescopes"
arch=('x86_64' 'aarch64')
url="https://github.com/bguthro/seestar-tool"
license=('GPL-3.0')
depends=()
source=()
sha256sums=()
source_x86_64=('https://github.com/bguthro/seestar-tool/releases/download/v2026.4.6/seestar-tool_2026.4.6_amd64.deb')
sha256sums_x86_64=('dd8de0b0d8e2057f0114536734087043386e52d69c7e20dd5af82291e618ec15')
source_aarch64=('https://github.com/bguthro/seestar-tool/releases/download/v2026.4.6/seestar-tool_2026.4.6_arm64.deb')
sha256sums_aarch64=('ea1eb63287f2da99b5422fce6e2af9f8ec9e199eef089893a60c02dd277c1d84')

package() {
    tar -xf "${srcdir}/data.tar.zst" -C "$pkgdir/"
    chmod 755 "$pkgdir/usr"
}

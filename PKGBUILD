pkgname=seestar-tool
pkgver=2026.4.1
pkgrel=1
pkgdesc="Desktop tool for managing firmware on ZWO Seestar telescopes"
arch=('x86_64' 'aarch64')
url="https://github.com/bguthro/seestar-tool"
license=('GPL-3.0')
depends=()
source=()
sha256sums=()
source_x86_64=('https://github.com/bguthro/seestar-tool/releases/download/v2026.4.1/seestar-tool_2026.4.1_amd64.deb')
sha256sums_x86_64=('c7096106ca7018c02fc60e5b02b156ec07763a526fcc4edfa3cf7514cd74a939')
source_aarch64=('https://github.com/bguthro/seestar-tool/releases/download/v2026.4.1/seestar-tool_2026.4.1_arm64.deb')
sha256sums_aarch64=('3af2ca1f0ce5c089673cae4925834cf6b130c323518f66f0cf78272af8f0ea5a')

package() {
    tar -xf "${srcdir}/data.tar.zst" -C "$pkgdir/"
    chmod 755 "$pkgdir/usr"
}

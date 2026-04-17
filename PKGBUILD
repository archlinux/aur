pkgname=seestar-tool
pkgver=2026.4.4
pkgrel=1
pkgdesc="Desktop tool for managing firmware on ZWO Seestar telescopes"
arch=('x86_64' 'aarch64')
url="https://github.com/bguthro/seestar-tool"
license=('GPL-3.0')
depends=()
source=()
sha256sums=()
source_x86_64=('https://github.com/bguthro/seestar-tool/releases/download/v2026.4.4/seestar-tool_2026.4.4_amd64.deb')
sha256sums_x86_64=('1de34b2a1176ab03c97d74f24d532b91b81d232b0aec28626f1cc9032cdfac2a')
source_aarch64=('https://github.com/bguthro/seestar-tool/releases/download/v2026.4.4/seestar-tool_2026.4.4_arm64.deb')
sha256sums_aarch64=('351f26036350fb18fb200a5ad3889c9bf7a4c1972732132dcde903c10c047734')

package() {
    tar -xf "${srcdir}/data.tar.zst" -C "$pkgdir/"
    chmod 755 "$pkgdir/usr"
}

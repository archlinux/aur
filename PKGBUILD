pkgname=seestar-tool
pkgver=2026.4.5
pkgrel=1
pkgdesc="Desktop tool for managing firmware on ZWO Seestar telescopes"
arch=('x86_64' 'aarch64')
url="https://github.com/bguthro/seestar-tool"
license=('GPL-3.0')
depends=()
source=()
sha256sums=()
source_x86_64=('https://github.com/bguthro/seestar-tool/releases/download/v2026.4.5/seestar-tool_2026.4.5_amd64.deb')
sha256sums_x86_64=('9b58fb83ece90e7abb826deccf1f2bf779f27a3a9240980adf4e02218578060b')
source_aarch64=('https://github.com/bguthro/seestar-tool/releases/download/v2026.4.5/seestar-tool_2026.4.5_arm64.deb')
sha256sums_aarch64=('b2d0aecd3d9f517f89deac2e487d5b19cf0d8e724b85a3a681e58b173e3df2ad')

package() {
    tar -xf "${srcdir}/data.tar.zst" -C "$pkgdir/"
    chmod 755 "$pkgdir/usr"
}

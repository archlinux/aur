pkgname=seestar-tool
pkgver=2026.4.0
pkgrel=1
pkgdesc="Desktop tool for managing firmware on ZWO Seestar telescopes"
arch=('x86_64' 'aarch64')
url="https://github.com/bguthro/seestar-tool"
license=('GPL-3.0')
depends=()
source=()
sha256sums=()
source_x86_64=('https://github.com/bguthro/seestar-tool/releases/download/v2026.4.0/seestar-tool_2026.4.0_amd64.deb')
sha256sums_x86_64=('4f50022c6ad0bce066b14d700ef76a4fa3c65d96f8a56060a45d28ed656d2363')
source_aarch64=('https://github.com/bguthro/seestar-tool/releases/download/v2026.4.0/seestar-tool_2026.4.0_arm64.deb')
sha256sums_aarch64=('ac586e3fa27ba6c48095c329617ee165fa117def0556cf786bbd7e83a4729f92')

package() {
    tar -xf "${srcdir}/data.tar.zst" -C "$pkgdir/"
    chmod 755 "$pkgdir/usr"
}

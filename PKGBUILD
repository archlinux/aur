# Maintainer: vyogami

pkgname=paruz
pkgver=1.1.0
pkgrel=1
pkgdesc="A terminal UI (TUI) for the paru AUR helper"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/Vyogami/paruz"
license=('MIT')
depends=('paru' 'pacman')
options=('!debug')

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/paruz_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/paruz_linux_arm64.tar.gz")
source_armv6h=("${pkgname}-${pkgver}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/paruz_linux_v6.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/paruz_linux_v7.tar.gz")

sha256sums_x86_64=('b668703d43260e2d7221999c89bde114663de7b0c0d1e3c0c749f9a136081aa6')
sha256sums_aarch64=('7016a199de0dc628b688e3dce5c7e7bfa925e214aa65def0925b79de07e48313')
sha256sums_armv6h=('1462e9fc3cfb53329af2ff5c9e56525b101b2c217b7f5b655a4b419b042d66f4')
sha256sums_armv7h=('4756d9dd548262bcb29024dc375e7c4422e9f812d4c0260104e112c1ba685c76')

package() {
	install -Dm755 "${srcdir}/paruz" "${pkgdir}/usr/bin/paruz"
}

pkgname=seestar-tool
pkgver=2026.4.7
pkgrel=1
pkgdesc="Desktop tool for managing firmware on ZWO Seestar telescopes"
arch=('x86_64' 'aarch64')
url="https://github.com/bguthro/seestar-tool"
license=('GPL-3.0')
depends=()
source=()
sha256sums=()
source_x86_64=('https://github.com/bguthro/seestar-tool/releases/download/v2026.4.7/seestar-tool_2026.4.7_amd64.deb')
sha256sums_x86_64=('0b1bb32e3b2de638b45959e3cb2250b322d66a6abebea77e4d53772e501db019')
source_aarch64=('https://github.com/bguthro/seestar-tool/releases/download/v2026.4.7/seestar-tool_2026.4.7_arm64.deb')
sha256sums_aarch64=('1ad10699f78eb846e2a6c41ed1375fa71345d3d59f6863e6c36a885bbe0a3a98')

package() {
    tar -xf "${srcdir}/data.tar.zst" -C "$pkgdir/"
    chmod 755 "$pkgdir/usr"
}

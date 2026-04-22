pkgname=seestar-tool
pkgver=2026.4.8
pkgrel=1
pkgdesc="Desktop tool for managing firmware on ZWO Seestar telescopes"
arch=('x86_64' 'aarch64')
url="https://github.com/bguthro/seestar-tool"
license=('GPL-3.0')
depends=()
source=()
sha256sums=()
source_x86_64=("https://github.com/bguthro/seestar-tool/releases/download/v${pkgver}/seestar-tool_${pkgver}_amd64.deb")
sha256sums_x86_64=('4af2e251040d5ba9a2f44750f881e60a266820b10391dbb1c624a773e8205e56')
source_aarch64=("https://github.com/bguthro/seestar-tool/releases/download/v${pkgver}/seestar-tool_${pkgver}_arm64.deb")
sha256sums_aarch64=('35b4dadcc5564d61fd3b35429f37e268ed081f374c295ec78cfd4b1aafbf4763')

package() {
    tar -xf "${srcdir}/data.tar.zst" -C "$pkgdir/"
    chmod 755 "$pkgdir/usr"
}

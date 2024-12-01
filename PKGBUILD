# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.0.2
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin")
options=(!strip)
install=.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_armhf.deb")

sha512sums_x86_64=('00b91fe3c15b7a857b740b880622cac5724bbd802aaf73b1f0efaa4005ae6e2b76d95107a52b285ea5a080b0c9e11835ae401fd9da48262e7eada922d1a8e2c8')
sha512sums_aarch64=('694662dcb22fae67e4e843291ed39fde126892572838506415b1da2e7365f4059cc294f26c4e41eae5d17327ce41b411a4e501196e04070f8beaaa1a31144f4d')
sha512sums_armv7h=('610447167bc6450fb77095a3a9fe5f2816ef06b3c55f65265d78de0f7384b3f8f16b6222dba29e76284ef06bc4a6e51a1b5b33f2024b7d6fd1eebdf291caf5ce')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

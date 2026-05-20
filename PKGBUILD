# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.5.1
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'rav1e')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin")
options=(!strip)
install=.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_armhf.deb")

sha512sums_x86_64=('56a0d552e014bd6c442e9e1da2dc8a7ecf384e891f3b59eaf42301ecb52b1f297076ac1f41b155d5ca3217926df1104493f9b2094c3bb4b3fb789eceaf867806')
sha512sums_aarch64=('63e8f6e0b0ea82ea2e74aaab27c7cac7c519089668675c596f19ac92e8af7002fcbce3a09bd824e3539456dcecec6a26b1628b6c752dce5d775b2366d6099c0c')
sha512sums_armv7h=('74aa99890eb0e06fd67543d67546589fb2e66a4c16044f4f989494f36f62358712add007b80cff8d1992533222552ca130ba1eba565d389ee7861d9976630a4a')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.1.1
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin")
options=(!strip)
install=.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_armhf.deb")

sha512sums_x86_64=('74a2ac1b15ca3640efc9e9a98dc2084b330fb847f8590c60986c3e5174f6926355fd42db16d4b6ba4ea7bc16cacba25d9849b63dc4e51d97ab15e8ee2f23cd5e')
sha512sums_aarch64=('10add43bd7602c3856057705aa62311e1aed3c76e3e98b08509f9ca76002b5bc24ee75d0babeeb0ccae874dd5715b1867de9a880cbfcd8ddd1b618a6aac745f0')
sha512sums_armv7h=('8b6b976f0614938e7bdd7c3270754204794a84db3b4110818cf20845fb7ce214f0f70d54a13f6915ad70496d3f7c69f3cf89785049d3b0bb2ca1a5894f3c3e09')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

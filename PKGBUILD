# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.1.2
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

sha512sums_x86_64=('773ea007fab335f671ef15c15fda7344ece646d8acfddde885175a62aa10710f29bb19957ee7b6d763e24e1194fa7dde041527a2674f84b4ede3bcae434a61a7')
sha512sums_aarch64=('d88fe550ff1ac640b0042e874edcf0ff02c02bbdd20348d6a777d13bd92212b0b8b4ecffe79f55645ea303120df9ab9fc139a46203bf79eb0a9c83544e412589')
sha512sums_armv7h=('89b213277c2e4729d3403870be7a26049e5f9666469ad1840ac42186c40be5ea6541e24c323b83d0112431176d8bc2a7dcaf3ab5acfb8935fe49eeec37a0ebcb')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

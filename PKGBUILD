# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.5.8
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

sha512sums_x86_64=('618d27933728aa8a44f232c3cd84fe4442c94f76ef6b2725a71d82692594b189028a035cc7e71d5a58e3538e536dee702c4e326288d1c243c1fa54ded222391e')
sha512sums_aarch64=('a4ab68e2e7ec7f202d9d89e7d7780ae27119d33c294fa7ce7f2d5cec89407f89e78ad42e045c82bf465aa7ccaecbfb57c229afee048976e1dc2fe3c461b773ec')
sha512sums_armv7h=('87eb91b49cffc867d630330f26ad52a67c1d724028380da8c7a13d305e0236694fa345a53de4e1f20729b6f1be6e5a05dbc67765dd0a30e3a2473e32efacb1ee')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.5.6
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

sha512sums_x86_64=('50e1f4b0e85d4c12c753822572b0c790116968a130f41741afa38a595c9388ea2a324b03c94804351ec4196dd08d615c86b54ccbf7088e5c887ec18d92793636')
sha512sums_aarch64=('82966cd2678f1320b0d03231fd7ebbd10ffd7d423268ee49b184869df5637227c0dcc0bab7ed4b3decba309d14bdbe70c9fd00b8f19c80ac44b46188d2c1bb5f')
sha512sums_armv7h=('6aa0e8e7ef16fa65b051ab61ecee0bbeaacd9d9d3e7eb41b428ed136e479410d3e2f6bab0053669abf8a5a517cc487029aa8bdfdfab11c19fba1ee11bd1ade61')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

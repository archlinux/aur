# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.5.5
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

sha512sums_x86_64=('97e08a531e19036da218e472168b15e975ef0cf65e6e2646dc611a6d8379908307365bca0839891b287c7c3c5cf5e2c744887229f38acc2ee6dd9521924ca317')
sha512sums_aarch64=('e8c17398fa8c089bccd008ba195cb650d5cc6c04792f1c546b288ac469c34e949c6b70d18ae12c49d530537238aa28e35e4954bd5b936ec31de952c6819f8211')
sha512sums_armv7h=('90e4096d5dff783d83cc1183319dfa0d75ef953cfbc9eb11f265ca3841320876ee22d6ec86ab47b07d2f02a7180df74d1aca334b4f8a7cd447e86825515d1e78')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

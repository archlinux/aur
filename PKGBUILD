# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.4.1
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

sha512sums_x86_64=('d35fc62e879864900164487488b4f3f82c0a58f3036c5b5f2c15b0738898126efdce73194506a720397f21fc8b20bfa5d6f061b379a16874061b9b0c117aeed8')
sha512sums_aarch64=('05f7d714aa5d9dfceeac99807c67c11ca1b94a6f47dbeee450d0927b26f01f1ba9a178e6e484f6c23b792db075c22225b9f45fab1d1df3ab63919559613cffe0')
sha512sums_armv7h=('34aee120be008ef9dc2c9de46c858137b9620cbfe65b30dd7079c50402780eae629cc16557f95a9507ff7c60ee540a9f51aebcc6387c5f335449b9dccfee4cb1')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.4.4
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

sha512sums_x86_64=('e636d5a2e86f6fed71e5ebc8051f533014f0e03f08002ed1d01bbc1dda4774deb18026eba4d824e68f1b35ad3a5597a688ed8ebbf9e67e4cbe6a5d1de75142c1')
sha512sums_aarch64=('26744dad49c92f610c9a6f6117d9a3fe45c9d399fc8da5ed27465e0a319d7a7a514599d02230ca888056dd69c3aceadf3e396cc0d339b7bf4eeb7f0a467fd025')
sha512sums_armv7h=('48968a804a8890d2869d00d2bd65de3d1dc290010d4afad9f40f3b87a9a2940c18fe7767282f0cc6d9d5053942b74bd89fc64fd6699f6d833bcf020b1e9d5152')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

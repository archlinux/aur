# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.5.5
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-nyanpasu" "clash-nyanpasu-bin" "clash-nyanpasu-git" "clash-meta")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_arm64.deb")

sha512sums_x86_64=('591044d28898ce1eee768776585056f9b0ecf90ef8a1093a4eb84f0579561d770bd56466720862f2e07f172df5bbb457cfc5fed1dd6936a7b41745b4e219a246')
sha512sums_aarch64=('30cb191f7126732cd30a202063a788866bf2f0bccd57f300cd97520eb3da6b2eb530376e845b814e5c5b74be6861302ab44aa865b020939427cc436c8f222d85')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

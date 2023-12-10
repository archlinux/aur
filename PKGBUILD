# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.4.4
pkgrel=2
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-nyanpasu" "clash-nyanpasu-bin" "clash-nyanpasu-git" "clash-meta")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")
source_i686=("${_pkgname}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_i386.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_arm64.deb")

sha512sums_x86_64=('ee9fcaa5c08143007635b5c07c943c00bcab6913dbe21bf0e750dd733298a8920c3784100a49c983637e9877271454b736659f22f911529c9c1d1f778e9e18d7')
sha512sums_i686=('a2e1a7fdc7fc73a3f2f610773cb274db5e3a4c2f12135489be68b425e2e75a27d0c360639152e403d3e98d16ba6b4b75fd87e3d7453e59f7ec4d7a0934c5bed2')
sha512sums_aarch64=('85f7e6a1ecce59fb04112c0e877e516b4db5c56a46c416004f5117846e92e9d248d8223019c7b0a371d1b07a60eaf0a461da431b6979e65416cfb0c671d7c386')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

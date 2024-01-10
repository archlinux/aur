# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.4.6
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-nyanpasu" "clash-nyanpasu-bin" "clash-nyanpasu-git" "clash-meta")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")
source_i686=("${_pkgname}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_i386.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_arm64.deb")

sha512sums_x86_64=('44b7120af53d236860d79925a4e0d09b84eda659b230d8fd3ac9bf936195bd7ea83a13788f7dd04cdba20ea75b26aac965852b1fc561c85617b4a82c67214b1c')
sha512sums_i686=('af5d7237e2da3cf38b0900c5212a7265e11767a8dbfc5cd37cdcfce4c4f62cfab85f8e1f51e986ff096ff3a6042e95a911b11dea2877f67762a86f4fa8ae6832')
sha512sums_aarch64=('d7a182674001305c06cce9a3f98184c21944d24aa6b624ce20b325a050bf28ec60e44651df725508fbb7ce557b83233029eadf356cac90d0c7be9db1894f8823')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

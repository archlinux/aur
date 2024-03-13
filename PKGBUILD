# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.5.7
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-nyanpasu" "clash-nyanpasu-bin" "clash-nyanpasu-git" "clash-meta")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_arm64.deb")

sha512sums_x86_64=('23bebd1b1821bcd9d86ce056f695d74b7159e81824558b4ae90c98e2a8fd694d03c49c00436903ca5f60f381f7b5d6c70e1af9528f73bc7467f0ea724fccb25e')
sha512sums_aarch64=('4694761cdfc1f4088dc5066a75d0a04efb828f18458aca06043b7952d599706fa04e398a8adf8c828c46a197b47b7a9d1c6a123be925b702d2a7acc40ca0c165')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

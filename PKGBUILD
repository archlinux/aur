# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.5.0
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

sha512sums_x86_64=('edf3d62618828a63d2b6c1262f1a387796962e0e7f23db7f30eec6172fec0dd756f161b69e3507be8e0eaca9da4bd5b46f6bdc8e7ea9f3b31e2a4609958e1ba6')
sha512sums_i686=('2229cad3807afebdd20d139c6acb10c61fd7531d3dfd7718acadd7bfd7d48ccadaf51527ddd50959b2db1bb13cb194b07cdd7aff82ae873a7ecb27d8c45362d5')
sha512sums_aarch64=('1d3df833912dc10ea404f8049347a0ebaeecf6b2e505a7a29569899e3bd6842bfba1c96516d20bde8bf743b0ed06e774ccb89a229c9cf8708dfd5c61239d88e7')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

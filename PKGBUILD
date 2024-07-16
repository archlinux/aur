# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.7.5
pkgrel=2
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-nyanpasu" "clash-nyanpasu-bin" "clash-nyanpasu-git" "clash-meta")

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")
source_i686=("${_pkgname}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_i386.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/clash-verge_${pkgver}_armhf.deb")

sha512sums_x86_64=('31588a368a9ce198bca65149e1632076d6c5a514fbf541edb9a98a103ae05ce89b7de0458a21c020d5384c59a7edab0a48be8014871cde41128e345763202f15')
sha512sums_i686=('ccafeb29cabaf88b183e437f54f6eced36c25b639edca1c41df9bbe286be234496eb476dfb2aefcf9d50fc46644fcd24c751194f3092234d223489444cab8ee6')
sha512sums_aarch64=('edda9caa4d4aaede003135ecf32ce6cb79b620acf481ae5ca0e3e0605523cef3d8afdf79c9897bd39d371706effb6094ae18411ec2a4472fe842b4d8d446ef42')
sha512sums_armv7h=('1e26408355e02fe2e6d949faaeb525f09ef609c7bff10cbc28802279ca6c72ec9e4bd7bca4bf7f50e8e83a7e912e1da9fe93f4a9bbddf4c5a00e96634848b543')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

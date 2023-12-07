# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.4.3
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

sha512sums_x86_64=('b0d7ecf7e7be4d61e0cdb6585adcafcddef799c19a06e73622ea057c4640850805c3a7a8302e19538f79e20a171b9ec9a11ab80eab54c2f07264a8314a661cd6')
sha512sums_i686=('2e28d3bae19b137edd4e9845a2d89e6ee18e33efd795fa02128ebb49043bcf8c0f64afb495ff88327bfb7dfe91022211c0b238377dc4caaf8379babf872fbc92')
sha512sums_aarch64=('e7f631bd92d05afe6ab97a00a8e1619ad2eb00e251683da7039f3a76bd34110c201a10ba7f15e3219a90eba2f46ce585cb1d0c8767f2a44979728139338d86c1')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.4.5
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

sha512sums_x86_64=('9be1490f5313f63ef7ee8ebdc83a24085b6f11d5c59b10dc9a50e0509642c61f3855bc3281cbbf2f4d5a0dd95058578e0c9275082eee41be2d7c4cc68b8f37ba')
sha512sums_i686=('274262c1998335e990ed303126d70473d1035cd31285790b8230b668753ed624c89f330257bc104c53bb1217f781be27deb6c343298a9fe7729eb69b28848c4a')
sha512sums_aarch64=('197e37d21bc547e09b95c5d11a77bb424133b20a0c217aff87d9256145c838c73b7379943b17ca66fb6cb2d949bc593a548351c6c134fa0aca43b9064b7089e9')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

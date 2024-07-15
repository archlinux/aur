# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.7.5
pkgrel=1
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

sha512sums_x86_64=('d1c6758f17f800aa686026e62543aaa8585f5546e2c1a6fa10db6adfcc6a6cbb7e8dbb411e1ce41ee92ef0aa03270acd5edcdd4e8cc55959dbad1a0dffd4ecc9')
sha512sums_i686=('7bcd1280d3c0f16dab506ec7840f6eb117d8736dcd684eb4417b31fa765767c3f986e1653fbfc72acd4616226392cb72621c5e4e51ebae653c4a94a23dd30c7a')
sha512sums_aarch64=('16ee908fa29fa08a3b60e9c936ad5311ffa5f67cd0e283fede55757d56e110ee8bfa358cb99ca586996c345636f5d8426f68bcd1412dfe52d6942079e49149d2')
sha512sums_armv7h=('447f7927d8165dd79e23dd9d891cdc9937e50686aa8a4cd9bfe880abddc70e79fa7bdbaa349d66fa08c25a690284a7271147f34133f8b856a3c87ada5f0f37e3')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

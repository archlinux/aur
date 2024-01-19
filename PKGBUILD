# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=1.4.10
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

sha512sums_x86_64=('e660f940f76894f6bd4a1b528308e2c5d9f11c6cb4e174341be1a33df07d65310980514bcccdc76541d9063f22db1371996d255a4718cf3aa497179d76d22310')
sha512sums_i686=('86869c39fea0dd6c6a8cbefab9451c7dafb075729243b409fea5161d2eaf446d95d54abab3b1d6233d70b4d06489bffa694f2e4576bf7155c153812824410a21')
sha512sums_aarch64=('8b307cf49f6a05043953cea7517f3096770e15f3f1b70d4d133a00562187e8f7b6650ef677b6cb4e8d18b4a1796679c43b74b408c32ab33b9b31057e299539bb')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.0.0
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'qt5-tools')
conflicts=("$_pkgname" "$_pkgname-bin" "$_pkgname-bin-concise" "$_pkgname-alpha-bin" "clash-verge" "clash-verge-bin")
install=.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/Clash-Verge_${pkgver}_armhf.deb")

sha512sums_x86_64=('51adf38d53eb26de6b7ec74b19f808a99cdb3b6447e48e1781ad6115903a368665768dcc71cab0b000afe060dc29b1e25c24b369cb7efb8f9ff2b849976d6ad6')
sha512sums_aarch64=('19e4d171f76677a790c3a8c83810ab1484450a92b783f02ba9bdecb67f4421db5c5a04f17eda0f873d3d2ae3984b59a81f7b274e6ade81f87da343b7845a5120')
sha512sums_armv7h=('2e834c05b20625a6c4686e2e9bd6d4f6a2b98d4e66efe2bcd3216455835fd814f5363a591c53bbaac8519e420cef7155cbd2fba26f514f379b0665bb9a942d23')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

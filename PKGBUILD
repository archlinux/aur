# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.5.0
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'rav1e')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin")
options=(!strip)
install=.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_armhf.deb")

sha512sums_x86_64=('5299a4f1051f18b0bc718dbee13b917b9ee0b2370d948ab54b9b2a781c3868d63d013d73e3e2edd6915dbe8033611c4b00c93b4c650519a525d61106507ccb3b')
sha512sums_aarch64=('e572b53bb089b2f84c1b726af14678f3aa7e461d1aab89f620a258512ed23a8afbc518a8f0ddb48dfbee4f0640806bb3a297be1a38b4caf8f4e5b0cc27540f53')
sha512sums_armv7h=('2061874bc2a43704268aa25c134289465902addaef140ef3d6715fd02a8a72fbbbab9765da963906dd7944b9dc3c367b4515cec530751a10e561e7031cbacf7f')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

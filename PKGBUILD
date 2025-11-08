# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.4.3
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

sha512sums_x86_64=('55175778ba09782f331ebdefb004b34f7af02e98edf01c76f876a8391a0d03e645181774bd0cae16c7b54656120eeb52793566b9a68ec058cee4bb6270acabf2')
sha512sums_aarch64=('bfe174fb8e015d4672ac3d08f48ffbeb4b7e8974d1191fd3ef7dd65e6fee4cf7bf8febfcee734819048128d92c375487cb2cdbdec82104b788f2b61b2353d339')
sha512sums_armv7h=('5806b6b1bf56dd458afa9808b2cfe57fdf161a2a58e8d6f4d7b360a53b2bca744be7389bba00e2a1c1c013c12f5706560ff1be244a2978a6b06bc10e5afed1a4')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

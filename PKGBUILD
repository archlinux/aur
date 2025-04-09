# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.2.3
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin")
options=(!strip)
install=.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_armhf.deb")

sha512sums_x86_64=('d1c918cb73db75f3caa6477c21c469b7a0542ce5946800cba898b7fcd0b20586f03be593170e5f466a4ca1fc7549ac9a39139afae6bf02419a98c7f6da9a1c3f')
sha512sums_aarch64=('1f70097683b2b6e3550a7acfec74e82e19cdbf5a3f3bac1267564415cd2ab69ec4d1c5f4f9acc7a72932b84c60b00c12f1b439a584a7708b4047f1455dfe1ccf')
sha512sums_armv7h=('cbceb5b7096e845a05c101affcef87e1033752abe2d1c3eb7731da356bbed0c50366f634bb8f4d45370da7eafcf97dd7c6930d8c5ff194c4cbb8ed140796e498')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

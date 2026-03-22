# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.4.7
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

sha512sums_x86_64=('b38d8a19fa97fb2c819419ee4518f298804adc1e089bc37683038644ddbfe7dec875286501bf081365fabda4d4bc319e0c0fc2ea8f8302538cb723c88c329186')
sha512sums_aarch64=('e5bfe03079e7ba902fa08e6cb74c72fdd0e3c4980868903e79bf458682b31b8fc9f92a7f4730088a6a09eb21e7020e074b5212e4f673d2ae133634fe0e91c62d')
sha512sums_armv7h=('e375d0767810f5efc875aac73d6f380a72c1f8b9f617f1f6a816ff1076f5bcb39ba301e894763276f5764e1bd4282ce43a398f4097b235149d05724aca166151')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

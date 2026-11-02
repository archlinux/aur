# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.5.9
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

sha512sums_x86_64=('c94c27afa1b8a228d367f04d5005ea2577949ef4ce7c9aa4cb9a99e4d04947494483d26aee198187bdb5bf267054dc662948fcc653a9fb0ba90a85c1317dbade')
sha512sums_aarch64=('ff3fc98b6d34b8edd697f495faf09707c5b4a7e5c547802557427093a63bd0c6c9c494d2bebe2d2f38b8fb522f9f85ac80d85d8c2382063d200b250284982888')
sha512sums_armv7h=('43b37484c0cc7de2b7b765ecfcc506ffedf1427f41c077aaef4e34adeecd9304870481cfe12726fa12855cdf4cf995970fe021fcf0ebdada614aa26100a75569')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

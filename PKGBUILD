# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.4.6
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

sha512sums_x86_64=('66acf94928334e39f65a861909e449c6165eaf33ed123ffcacd72c85958e7b905031c1a1e59e021df2830a7fc56fe9d022b14e96ba504cadd92343cd14ea5817')
sha512sums_aarch64=('271bc9963465291c24f685e130a91be4bb5a91af5b26dcba817326a9165f74c3fd8fe2a5c19c0c59c29026dd6a6583eea8307b334ffbb8e241326088049513c4')
sha512sums_armv7h=('249bc674bfe658f5efd7f3fb3b0fa4066b7d062fb1255d8991c9353cb9ed7c7aca20b15762ed55aa128cee023976a6bd24e1c71521691f200580e619e11c9674')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

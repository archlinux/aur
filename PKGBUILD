# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.5.2
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

sha512sums_x86_64=('f35816d2cdef3a3d8ec700996c076b15291c70f2b1d347ead0f0c1fd370f8103e8c36b6d643e9de00093c6c51bf1a4a36fc5455645f972d322f992d438e0770c')
sha512sums_aarch64=('2e53b0807380cb92eba4be370a6f79e8546706a58841b7d7ff933b555a662976433512b5a2a2c3679104874ef8eadae13aea67cf3f1b7a357de99c7e6418d0b2')
sha512sums_armv7h=('614e73d32494963f19b9f9ea121e9068f595cde4470d0e616d2cd27d67546209332fa4643eb0d60acf905adffc35c383045eff4d86e4ac7d9ec4f8904c51285b')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

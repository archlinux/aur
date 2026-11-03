# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.5.10
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

sha512sums_x86_64=('e4430e70b95c039a129414cdc4d52f752968994330ec457d3ff77d75257a26544fb4693b95bb0d5776a6d43b8ffbf74293edc837ef895c76c347ba221c48e7d1')
sha512sums_aarch64=('e3a5211b53685348fc94222739674a12a86fc5e406c033001c852ef6d302b663a6cde9d512aec34a817cdb8fc8a704de61edb5b173c251c0fabaa607ad654d8c')
sha512sums_armv7h=('9dd088b24840d5b04dd2d8f54a5e8e8803f8ac73af4aaaa2108530ee04683bd14cacb03a0ce931f1a87335d409a700f720107e515f59da6017960ae874f85ef1')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

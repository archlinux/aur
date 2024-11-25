# Maintainer: Azure Zeng <weedycn at outlook dot com>
# Contributor: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev-bin
_pkgname=clash-verge-rev
pkgver=2.0.1
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin")
options=(!strip)
install=.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/Clash.Verge_${pkgver}_armhf.deb")

sha512sums_x86_64=('1dd534da55e4337cf3025c9fa1896ee9974d44ca6b27578e821213d0a408972bb028c1c07690719804fdeba485765c2f2ef656c41532e662cbece92a7f069db7')
sha512sums_aarch64=('70d3dd9c5f0f13ceef8a7a89e4dd53eb0dd3b42a51774c1105963f02a05f5fb23a5ddd1de5dbf338723c2c3203d71aa78af32d11bb5e8388a9e4c39014dbc2a8')
sha512sums_armv7h=('9db01b77c6a232fd17334f9bd4c60702f26ed26b9592d55c8fccb65a260f5c088ddef23a745166d979fa7d1d2e19d12c075b427dfe39d44dc4c63efe561d5a02')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}

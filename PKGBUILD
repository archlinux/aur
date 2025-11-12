pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.4+autobuild.1112.3fab4ce
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'openssl')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin" "$_pkgname-bin")
options=(!strip)
install=.install

source_x86_64=("Clash.Verge_${pkgver}_amd64_linux.deb::${url}/releases/download/autobuild/Clash.Verge_${pkgver}_amd64_linux.deb")
source_aarch64=("Clash.Verge_${pkgver}_arm64.deb::${url}/releases/download/autobuild/Clash.Verge_${pkgver}_arm64.deb")
source_armv7h=("Clash.Verge_${pkgver}_armhf.deb::${url}/releases/download/autobuild/Clash.Verge_${pkgver}_armhf.deb")
source=(".install")

sha512sums=('8d1077b7849dfe505d16d77b8a9891bbcc7804154a6bd86c11a224274f41550ffa28dd212a3d9cf25c70c081c0976a717d0345b045e41c5db90f95e93b07c1a3')
sha512sums_x86_64=('496806475e5e496e8c22a257cf1e1e1dc0838cc96f565ff2bd04c2993ffae0ef21e49529ef6513639008b79e12eaffddae00a49dc8a8fccc9b1022c558780489')
sha512sums_aarch64=('eecdd0d2d8afbfe2f67c0fc57dcd712cbdd6d36e15964b541c998f0c0384efe4098da1e977fba5446cbc20acb176ea5b27478395115f936a357af2ecd859e3b7')
sha512sums_armv7h=('b70bfa7c96db61a0175582c8922302db97c0822b0c0bd77fbf04d2233ce5a2d55e5ac7bf5f17c6903448c97e743d0d31db5e7b419a67ecb7e691a5daa34efab7')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.4+autobuild.1115.272c2f3
pkgrel=1
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'openssl')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin" "$_pkgname-bin")
options=(!strip)
install=.install

source_x86_64=("Clash.Verge_${pkgver}_amd64.deb::${url}/releases/download/autobuild/Clash.Verge_${pkgver}_amd64.deb")
source_aarch64=("Clash.Verge_${pkgver}_arm64.deb::${url}/releases/download/autobuild/Clash.Verge_${pkgver}_arm64.deb")
source_armv7h=("Clash.Verge_${pkgver}_armhf.deb::${url}/releases/download/autobuild/Clash.Verge_${pkgver}_armhf.deb")
source=(".install")

sha512sums=('8d1077b7849dfe505d16d77b8a9891bbcc7804154a6bd86c11a224274f41550ffa28dd212a3d9cf25c70c081c0976a717d0345b045e41c5db90f95e93b07c1a3')
sha512sums_x86_64=('a02d6a92c221866efd5eda8bda2840b43f97f74e270ecef1f83c06d25f5ba5be3323088e4f8c8e57b8fd075ec8a3db5556f1b746be58371d75b93b90079b1578')
sha512sums_aarch64=('4ceee807bbb3dd6a7be418aeba8bf26b36f51cadabfa606e208f931582cbafc0b3e27ff970909efcfecdc00062ace5da395f06f9246267a8e0b9c9f055cc6486')
sha512sums_armv7h=('ea0136e4e85958062c5b85e8c4b07a1fa349885c0acf29c8a9f5eecba3098f69e3597b71d96dfe915c927c8452d95fc72e960da9ffa89481784b402cc39bedcc')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1103.1003118
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

sha512sums_x86_64=('18abca8a2e0536de23014bc43b751016f52959e0b3e1196b3b9c06386881f35e374936e8a2feebba3bc90063c91b43233441b3a6f93422e807dedb69c3ba557e')
sha512sums_aarch64=('4e3e4f2d69f675643c2bdc84c5e84fd78507357b474ac0fb9834826a1939094cd2ecab19b007a067583c7c97148e9a2272c0127bf821f137af085368ea5840be')
sha512sums_armv7h=('91d4d15856ec0f5756c971361f82d903ecdc6b249e6979ea3d14bc8d50eeb430f33bd361202140780dde0b3bb31bb5237301b64fd1c6d7a421467aad8f883d58')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

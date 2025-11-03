pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1103.54039c2
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

sha512sums_x86_64=('7890e07f7d4a531fb6245317a3a38a40c4a64791e865c45e39d5e0fa20cbea4e53a4e6d0867e185017636a536bd80212874b3101a3f766ff9afcef2169fd6ba1')
sha512sums_aarch64=('2d1a8d15f07dcbedd9d6a226dead4b70edc8d7b1c23582c42a60d4ff19dc57b3e90ab869b4b3666ad66d8c00fa3df2ea8bb69b3a578ef6a2636041ca04d1cb9a')
sha512sums_armv7h=('2dddf1593dd32e0c941fc48c0d77d7a73703f01499dfdad56f696bf6997feeba89a6a7795ebd6104b2c1fc9ec396234e27059fd49ea5f8eb035790e5a60ed73c')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

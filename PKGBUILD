pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1106.3334405
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

sha512sums_x86_64=('af5690e54f28102a0ca2fa28ee573b61b62c6fd6a56e78ca54026426336009ad169e08772b9c01f68f98d986fbe87f460201f967ec4a93b16e31e33242780891')
sha512sums_aarch64=('c8eae7b42c5dd1d3dc4a2065d1f2058aac4a8ebfef170b1012fd0904f06a747da2978ca5f1c940ff6aaf6886854bc78e046744a68784a1e57cb4073629d1bc49')
sha512sums_armv7h=('6665bcca1d848e9145ef21e19d21575644f3b3cfe5d633ffff76361e0887fa8a013fdf7b125a8b3cca638dfcd30d6169ae575d9acf8509653898c9bb9e735ac7')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

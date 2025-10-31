pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1031.59e7095
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

sha512sums_x86_64=('17d4417cec169959b8b032b4a18e3ed37c7d0eb458efa72847cfed6fda393a68c0bfa37bfcd5f56d1946d973a23e4ba1528f8050af58c52ea084b5c91d0aeb71')
sha512sums_aarch64=('a603538e2279c85b68814eb1693138d145532f8be7333369e343d45d1eec645b98c367407a610b34cdc78335e2e53f6b33b418eec7191131e959a7830adbd869')
sha512sums_armv7h=('c75eb3d4bfba9f4757d6fffe49f421e29da83fdf03643ff9447bbbb990dfc2f0d6ec5ffd49f483fd85258fe22bce4329c6e4064f312e867dc90faf0e44af707f')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

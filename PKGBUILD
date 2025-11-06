pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1106.04fc964
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

sha512sums_x86_64=('282796535f7a748b2c0badcc4acf02ed1773d576e171ed876fef2272b26e3aacc85a1871fc898e9262380fcf16290011233dd0e174e05869b1cf44d1af62c20e')
sha512sums_aarch64=('357e85d8462a4c99991ec2d1685ff4a6413df9939c6a32ff36eaa2be9f1b40314ca5b21a8ef1e4c446a0617277a4f7ee287ffbe808bae15a58d079395a569c8a')
sha512sums_armv7h=('36170ab6c0fa9311a3467bb7c564dcb67c4f2fb2adb175ec0d3b27fa35b09b38c82c2cc6e2c2603fe6d7180006583f988964ab94e780fe4d144d72f98d71b7e2')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

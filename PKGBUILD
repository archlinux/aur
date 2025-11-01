pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1101.c6cafd3
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

sha512sums_x86_64=('ed58235eca38c1b27f1c4062ef4103c48df0bb7739759abc6387c9e0b7f804b107158cbabfc1d1de5590e7cceb7a749ee02100c85ad4a11eff27910315ac241f')
sha512sums_aarch64=('baeb860d155d272668bff350267c5c81ab7b571878e4221fbe986246e80ca216dfdea3e2b86c2d603d1bd97f13e833e22d365001210c8a374241250ab542a55e')
sha512sums_armv7h=('a1870e1f892dd5e92b0e120dd4ae274ade45831f96c803f1d44087e3478b3b53a21dca33ddbab2bc694787faa32ecc0e74831c557e645069eef13030892bd0cf')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

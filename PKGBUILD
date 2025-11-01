pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1101.30d1655
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

sha512sums_x86_64=('d5fc13498686f339df65842d93eb0655d64e43b77fa5f550400071c71795da6505c19bf6f931513971538033bfeff61920cfc014ad347ca02fe5dc269db9bee7')
sha512sums_aarch64=('fadb87fe538643c3e459bb211664b8601b6f502b14e7034deb1a86dd97b829fe7057084adcf3d8758b5758d0ec5e93be8dd24f0a55f0dda7488683e18d372ca7')
sha512sums_armv7h=('24fd5405d39733f1f11281997456cc16c71f155f8b3e91680f17fe6d89cab4e6ff4eb0d33ebeff20a8bbc495c9eff09300edae7df36ecbfc635bb8eff04d702a')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

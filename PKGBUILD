pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.5+autobuild.1226.8e27834
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

sha256sums=('35b576cd9d0ae453ead9f65537451137069150a91364f0560ea14100e79b35e3')
sha256sums_x86_64=('dde7ed88878aacc7fa704f6b1773f1437c065fae6719608906549da051feecc9')
sha256sums_aarch64=('77dd5d23774b4e57aefcc27195c6552760ace852d902895d213a03a2b936ce55')
sha256sums_armv7h=('77c080f3788e8676943be2bb880b799398acd3c852a9c5f4fdbdb15daeb3253a')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

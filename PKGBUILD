pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.4+autobuild.1116.dbb4877
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
sha512sums_x86_64=('05ab47c1273d38e8055fc0b7d3061c30ea8e2918d3dabedd85fd6dc33da28634888fccb4b1e9faa7b37a4860f25b2887757e5469de42779790e6cdc059c2ed1b')
sha512sums_aarch64=('121a2d87da78995183906e7439fd68eba5211b4f1c10d619e5a49a463a52a6f4dca18c2959031e70bd3c0a8e2251509d752b2abd8f07250fd7037946f95a0465')
sha512sums_armv7h=('6bba884875f53c5f353664aa3e5e5a57ecd2892958799e44bb5fa563d9fdd4bac2a66fe3e9a8b56530d359916a438d2fd4eab947c1fa5907244a612a3d4f2890')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

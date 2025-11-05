pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1105.ea41e71
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

sha512sums_x86_64=('2cd8065c8b26d1d8e24bdbcb58b3f93b85b6cd3100c0508952565099518f24917f286c08908f14d2d3b4e78a8da07be15dccfea867c641104a4d166d629248aa')
sha512sums_aarch64=('4cb3fa5de813827e2afcb4abd7dae4e37dd3bdf1928fa4311c086f27ffa016da4bd8ccdfdc6a6bb5237f42ac332020466adb684f449e219fb80147bbe81879b9')
sha512sums_armv7h=('60a00e9d0fd89523e837801af5bc4ea385eaf064eb0527ba216b8526795a1821934622fc26c26a4cc12eee7dc7bb9ebb88e87f044e1386ee5475cf415dce66fe')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

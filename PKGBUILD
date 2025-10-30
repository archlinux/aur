pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1030.e7a9f8f
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

sha512sums_x86_64=('ff78a9a36f2bba3d50cf1e7aed9535f91928bcffaa3afc3fcaf14e0873347661e84e25b1bf6da5655c84cc0143f741f416782e954207f254d3d7296ad64dd121')
sha512sums_aarch64=('ce98736176da6f0113ed8c4f141a312bbc85c8b81fd6da9f02cb327daf5547cf1d207c973903d4c0e9b346836f598b6a231c632d43da35e204d4f103e2665554')
sha512sums_armv7h=('c9942a5eb77d83fccebc598df1359723bd28488f21f422b9773c77c3eda1f1dc817ebab15edafb5f9061db348686e23d53b57c7cf6cdc329e4c44427b1268632')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

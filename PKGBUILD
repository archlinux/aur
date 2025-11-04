pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1104.7cd8f3b
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

sha512sums_x86_64=('9fa5ebf44ca4ba7c32895bc83c61500bbc1bc3ac3299b185db85706e60ed42632a9db4ae3aefa1af1823bb93384ff92c7360b5ae804c3410ba1a643003cb689b')
sha512sums_aarch64=('29e35f74a12b10bd71a88bb708d5caa2f3d4b4d46334f46267e92a66c2295c853c802be91663e60d6f96ba8d103fddeb02b4710eb0b7bd7a67e364751e4cc9fd')
sha512sums_armv7h=('f2236d1e5e0ad8bbdf8f279192f75b4e4f182936eba34caa7227b28e8bbba47b80cd35784803ac409382d99158df6d38d7409a7bcbe03772575381b4fe81c920')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

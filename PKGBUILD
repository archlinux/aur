pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1029.d8b0e99
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

sha512sums_x86_64=('c0b97f1c475a5ec3511a3734935747e3d7117ddd1462a3d0e2ac797f1273708ff16829df55650fc25dff61828204c833275d2410cd7fed5a479d55cc88ad2be7')
sha512sums_aarch64=('4421bd9b63bcb2938ff7eb3f4a18db096fc091896ae550fd8d56e3c935aed03b00bb978bed480d641e8facf02a0a7907b230dd8bcad5286d39bfdd53bbdc2821')
sha512sums_armv7h=('96279f169ef14086175fda260fd8d73a8068caf8a53779ca4c4ffc7a9a98877f928f5ec4050e7ddb17570a9294cf1d694fdc734fb75e017ce77fc20397e24829')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

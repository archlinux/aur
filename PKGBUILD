pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.3+autobuild.1030.928f226
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

sha512sums_x86_64=('a5101fbe8060c599936502a912e4affb558fedaf440f8873ec258ef1812c1295873eb348d1dba0ac864240152504abffc2930e3872b3003aca48005cb99e7825')
sha512sums_aarch64=('f584b1eb755b9ac9d38658d42987d43738fc73308f5da13ef50fd87bbe308070fdd37b399bf31a24cc9d78b1b346e631c8c1acad67b2edd65090910a359aa41a')
sha512sums_armv7h=('2662af53c65d68af7da77a3764ee04327d592fe48fc37f0e5c3774cd85477cfb1a14b3682d06f8d0b5f35cdafc64790909a6eacb7c7b1fdfdf9559daa4864e41')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

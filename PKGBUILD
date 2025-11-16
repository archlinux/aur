pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.4+autobuild.1116.e1fc954
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
sha512sums_x86_64=('61417b67d44036ab2ad24cb05dfe9efb1c9c22b31022c00539afb43f701e946bc70c5395ac055f71705e1f287e9cce08537cfdf2130764fe3175bce0942f5c98')
sha512sums_aarch64=('3cfb1298287c0296a545c2435e143d01f8156473f1a7f45c5a1bff9935fca4f5aad7b2c74bed7574f7cd866e8f7cf54160ba438b205315e08ab9aabe1ddff9ff')
sha512sums_armv7h=('347e2ffabb92c0583d54fe861fa365f21185c8db6fa792c949a73ef03ca95fe5af9286c89a150cc1e9f862ad9792d267745fb374d3028fe798719894f77b2914')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

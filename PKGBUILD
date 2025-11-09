pkgname=clash-verge-rev-autobuild-bin
_pkgname=clash-verge-rev
pkgver=2.4.4+autobuild.1109.aa4af76
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
source=(".install")

sha512sums=('8d1077b7849dfe505d16d77b8a9891bbcc7804154a6bd86c11a224274f41550ffa28dd212a3d9cf25c70c081c0976a717d0345b045e41c5db90f95e93b07c1a3')
sha512sums_x86_64=('4c148cb7d30ed7975fd720a5241f0fd1f34eec13fd1a04d9ffac8ed4e612514073cdbf96f088401dfa9472910cdd476969b8136c76de9fc07ef0d91c36b8759e')
sha512sums_aarch64=('b9f3fa09182b78502c235927d8d2182f58a3e9307c6eb4b5cf578322dedb24e4d5d9d491983235b5fc1d5b50b0f56e602094b86587bf826bb22ea4700e0433e5')
sha512sums_armv7h=('c68600d0f86b10c72b1eabf9f4849a5ed63ec587255ca35fa01f9bb0e906e23c739aff999698adc39115e2d2e5889653673fa02e829c9bd1b32ea68c7d33f1c1')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}

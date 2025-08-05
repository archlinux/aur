# Maintainer: coolcoala
# Submitter: prettyleaf

pkgname=koala-clash-bin
_pkgname=koala-clash
_gitpkgname=clash-verge-rev-lite
pkgver=0.2.5
pkgrel=1
pkgdesc="Fork of Clash Verge Rev | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/coolcoala/clash-verge-rev-lite"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-verge-rev" "clash-verge-rev-bin" "clash-verge-rev-autobuild" "clash-verge-rev-autobuild-bin")
options=('!strip')
install=${pkgname}.install

source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/Koala.Clash_amd64.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/Koala.Clash_arm64.deb")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/Koala.Clash_armhf.deb")

sha256sums_x86_64=('be6820bb9b32ecdf1a9036b6042acb7c3b3f6096eff4d1f7098a7cdbe090132d')
sha256sums_aarch64=('5c953aaabb62079b6bbc52eda24a9abc5667ea8e660049f2fadf4a83f8fc082a')
sha256sums_armv7h=('2380ee3b0f59a912f5cffb769635bf3bf5bf7ce3da577b2487c5cd7dee91fa7f')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
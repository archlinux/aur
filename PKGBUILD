# Maintainer: coolcoala
# Submitter: prettyleaf

pkgname=koala-clash-bin
_pkgname=koala-clash
_gitpkgname=Koala.Clash
pkgver=0.2.7
pkgrel=1
pkgdesc="Fork of Clash Verge Rev | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/coolcoala/clash-verge-rev-lite"
license=('GPL3')
depends=('webkitgtk-6.0' 'gtk3' 'libayatana-appindicator')
conflicts=("$_pkgname" "$_pkgname-alpha" "$_pkgname-alpha-bin" "$_pkgname-git" "clash-verge" "clash-verge-bin" "clash-verge-rev" "clash-verge-rev-bin" "clash-verge-rev-autobuild" "clash-verge-rev-autobuild-bin")
options=('!strip')
install=${pkgname}.install

source_x86_64=("${_gitpkgname}_amd64.deb::${url}/releases/download/v${pkgver}/Koala.Clash_amd64.deb")
source_aarch64=("${_gitpkgname}_arm64.deb::${url}/releases/download/v${pkgver}/Koala.Clash_arm64.deb")
source_armv7h=("${_gitpkgname}_armvhf.deb::${url}/releases/download/v${pkgver}/Koala.Clash_armhf.deb")

sha256sums_x86_64=('8f40ddf89de2caec3e76ab93595fde865d1ae1826884fda68c5ea414e34dfbc3')
sha256sums_aarch64=('640ca1656e0b784ed0275ec6ed830f0d0f6eb5d3485f7a9877e55b04175dba25')
sha256sums_armv7h=('d847d9619931694798028776d734aec97e7c82696e807b8289b55c959e02d957')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
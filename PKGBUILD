# Maintainer: coolcoala
# Submitter: prettyleaf

pkgname=koala-clash-bin
_pkgname=koala-clash
_gitpkgname=Koala.Clash
pkgver=0.2.8
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

sha256sums_x86_64=('f0781f1c39adac238b20bb8c1d07e4f587c14bcc1ddb881b36c9f49545dab8b7')
sha256sums_aarch64=('0638b35e80e887db195064b5752ba78d1e4712fee25ca5bb1d1e78bcf3627049')
sha256sums_armv7h=('b48437ced51f30ac84ed0d7069d52f433eb0c1e37458cc45897ef532e3983b4b')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    #chown -R root:root ${pkgdir}
}
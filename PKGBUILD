# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=223.0.2.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/223.0.2-beta001-roam_223.0.2-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/223.0.2-beta001-roam_223.0.2-beta001_arm64.deb")
sha256sums_x86_64=("c60f7ffb36353546c20af93aacd5a55bcd41a4726a0bb2074c39b4f9286103ef")
sha256sums_aarch64=("0aa8f1dcaccd4b890a459153727b35278ad00e986b2dfc7bba9cc59c530965af")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

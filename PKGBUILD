# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=222.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/222.0.1-beta001-roam_222.0.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/222.0.1-beta001-roam_222.0.1-beta001_arm64.deb")
sha256sums_x86_64=("2d4922af84922155357d9f71a2f644ff94a2b2fb16104371968910b00d973b70")
sha256sums_aarch64=("8e61d68c497b4cb1db1966b7500fb4547e9f2bc37dffc69284384975582fb854")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=130.0.3.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/130.0.3-beta001-roam_130.0.3-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/130.0.3-beta001-roam_130.0.3-beta001_arm64.deb")
sha256sums_x86_64=("a68e3a05618c31b6c9693bb569cb9b0fcee6b7c9ebe75db7ae70d2c70a12a0cb")
sha256sums_aarch64=("22a60d5e66cd50a564ad4fb66e5550673d8b74af4e94ca1825b786d3503e6647")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

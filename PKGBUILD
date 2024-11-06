# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=134.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/134.0.0-beta001-roam_134.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/134.0.0-beta001-roam_134.0.0-beta001_arm64.deb")
sha256sums_x86_64=("f9448a061f798470511b3b5d71e1a95de8988cefe1a6ca9b75a2911eaa3eb453")
sha256sums_aarch64=("75fcf9685c70d0d34d986c781600405675f16807ebd6c924094f9f98669bd275")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

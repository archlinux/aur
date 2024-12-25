# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=141.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/141.0.0-beta001-roam_141.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/141.0.0-beta001-roam_141.0.0-beta001_arm64.deb")
sha256sums_x86_64=("54c487cf48366b3fac214d7bb5b47c28b234644b87e8feec4489b80fdab7958b")
sha256sums_aarch64=("73a8808386d6e19c51984d6ee995826e536e101303d0db31da1c2d73defe1124")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=185.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/185.0.0-beta001-roam_185.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/185.0.0-beta001-roam_185.0.0-beta001_arm64.deb")
sha256sums_x86_64=("b161981e618c7667b3a907ea0f92b4fa7535793f83fb969f7de7909c0ba8a67f")
sha256sums_aarch64=("30b01f6974b67766e0312d78a446a05f6fd5d7b6ed530d026d8c00de4f39fabc")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=224.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/224.0.0-beta001-roam_224.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/224.0.0-beta001-roam_224.0.0-beta001_arm64.deb")
sha256sums_x86_64=("2303f853f5fd10a90ca461b59e21ebf8bcaa1e06a9499517fb6f3793faf8e8ab")
sha256sums_aarch64=("a520734a60cfaa093abd1240e57a66ed07157bd2d52df184c26deb5fc61463d7")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=134.5.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/134.5.0-beta001-roam_134.5.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/134.5.0-beta001-roam_134.5.0-beta001_arm64.deb")
sha256sums_x86_64=("a21eaa175e9d26b5a9dcb46dcbf3e5bd274a52ef14d2bb33036f9c71e1ba20d2")
sha256sums_aarch64=("aa48368b8e355bae7df55eb10f0f703709feba9fafe376be08e35c0c8e12de20")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=207.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/207.0.0-beta001-roam_207.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/207.0.0-beta001-roam_207.0.0-beta001_arm64.deb")
sha256sums_x86_64=("ee15a4993b4ede7179fb55ab62ce729dfd081b11d395b298a83fd67a252ca067")
sha256sums_aarch64=("9cf65c00ccc044956534ca6198f1b84f43287b7c97f0f80a606af4dae133bacb")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=155.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/155.0.0-beta001-roam_155.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/155.0.0-beta001-roam_155.0.0-beta001_arm64.deb")
sha256sums_x86_64=("3daec13b6cb0f09affc4c1c23c6d43221e16a9f6b6170c32eff2ceaf899ae73e")
sha256sums_aarch64=("2dc8801ade4055bf187f28866e1db170fe7bcc08ec23de0ddab0dc9bc0f4cf48")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

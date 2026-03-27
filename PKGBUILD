# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=206.0.2.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/206.0.2-beta001-roam_206.0.2-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/206.0.2-beta001-roam_206.0.2-beta001_arm64.deb")
sha256sums_x86_64=("6a8e80cc5d0de3171b82e35f3a7009d7858accfb6b380f670e04332d910d2a69")
sha256sums_aarch64=("d9aca63d6e86ad27728cf4119c1da033425a9d632931710c6ecd4fcd9f3475d3")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

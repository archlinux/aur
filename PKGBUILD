# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=156.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/156.0.0-beta001-roam_156.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/156.0.0-beta001-roam_156.0.0-beta001_arm64.deb")
sha256sums_x86_64=("28facfe9bec9318017947bcec983bf5ab440c01ec85cd715584b1ebbe8dd94e9")
sha256sums_aarch64=("5f368122622aa39903492569d3e6870e7ff08b1466d68418e3b40a2b955a474b")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

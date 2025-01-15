# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=144.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/144.0.0-beta001-roam_144.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/144.0.0-beta001-roam_144.0.0-beta001_arm64.deb")
sha256sums_x86_64=("35e70f510e4fa38b961e64abd26cdb95a5c28c6c7b0fd2d83f5d02b75d9b841f")
sha256sums_aarch64=("ded76184567b3dfc31ef25d2bde73d3c29c8312242cba01af1fe395f2dd5ed71")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

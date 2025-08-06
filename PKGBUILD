# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=173.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/173.0.0-beta001-roam_173.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/173.0.0-beta001-roam_173.0.0-beta001_arm64.deb")
sha256sums_x86_64=("f3bd8ac0b4ebe8623816404a9e2284cce891c54bb92ad64e960f2c0b6b49335b")
sha256sums_aarch64=("a55fdc9d42d2ba72451313180ebae328246ae864114d91c84b77983bcf7f3e75")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=184.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/184.0.0-beta001-roam_184.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/184.0.0-beta001-roam_184.0.0-beta001_arm64.deb")
sha256sums_x86_64=("5cc8814b89e0eb06a895c819319ad5b9e8dc82012c1f4a378dd9147f0cc29f13")
sha256sums_aarch64=("77de0af290d037ad52eabbdf06f8adad5dd47e59ad6f0989666d88aee8e77291")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

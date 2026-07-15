# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=222.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/222.0.0-beta001-roam_222.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/222.0.0-beta001-roam_222.0.0-beta001_arm64.deb")
sha256sums_x86_64=("ea9455eeacf99fc29889dbd9b57fb6d12230c11e2f1a28eaeace7db9a9f27208")
sha256sums_aarch64=("cdc7819e6b656fa26f9cba1913cdf515228ffed700183a2895c0ebe984367bd1")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

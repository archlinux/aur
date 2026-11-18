# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=240.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/240.0.0-beta001-roam_240.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/240.0.0-beta001-roam_240.0.0-beta001_arm64.deb")
sha256sums_x86_64=("ced4af4c2df0edf09f811bd4d7013b3de71a460c3344989124fbe1d7aca0b1ba")
sha256sums_aarch64=("05cf2856c51ef5636aef98b842837d4df0069447f7a202a15946af574e08b5f1")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

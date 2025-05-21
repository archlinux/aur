# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=162.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/162.0.0-beta001-roam_162.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/162.0.0-beta001-roam_162.0.0-beta001_arm64.deb")
sha256sums_x86_64=("aad19064b773628b21216bdb36e8ba73925e0b45577b0990253638f996132a6d")
sha256sums_aarch64=("4eb93d076b89eacc37becb6e7eb7b064e8bceb6925bd27eec7d59c493502fe0d")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

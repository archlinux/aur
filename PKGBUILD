# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=184.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/184.0.1-beta001-roam_184.0.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/184.0.1-beta001-roam_184.0.1-beta001_arm64.deb")
sha256sums_x86_64=("3e6504f065a376cceed78d3584722d2fe3c42b34ff2e2ee8342373dd43a0e27b")
sha256sums_aarch64=("fcf7af5ce1238110953219098ece49c18c6d56e52cfb7af77b6f32b44466e5d1")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

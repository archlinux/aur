# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=189.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/189.0.0-beta001-roam_189.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/189.0.0-beta001-roam_189.0.0-beta001_arm64.deb")
sha256sums_x86_64=("c9b947d579eb109dbd0ad2fcaf2d91cb1fa7d35d1541a284fc1200461b9a298d")
sha256sums_aarch64=("7bcf9b7d1aa16d403d69aa17b9bc52714435cff173e103eaa8d0cfd123b76a01")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

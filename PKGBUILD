# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=210.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/210.0.0-beta001-roam_210.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/210.0.0-beta001-roam_210.0.0-beta001_arm64.deb")
sha256sums_x86_64=("19034e2a09092651acbdbb09b29d515633159d6402fd7d05b8991bbc452c6f43")
sha256sums_aarch64=("06861a0dc21a4006f5a414bc380dcd603e2c8ed940444057590f6d3182dca2d8")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

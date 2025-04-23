# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=158.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/158.0.1-beta001-roam_158.0.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/158.0.1-beta001-roam_158.0.1-beta001_arm64.deb")
sha256sums_x86_64=("2da75160faca509a1c9792a49c71d16362b2a5509ffb9ee188eb01ce7b49e31e")
sha256sums_aarch64=("05aa2c274c570de6fd6b7152245ef7b2926b8edcfc6d60af418413cc48b0af80")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=215.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/215.0.1-beta001-roam_215.0.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/215.0.1-beta001-roam_215.0.1-beta001_arm64.deb")
sha256sums_x86_64=("79b9344ed73a1cda57d60c82b96a8a756a8f4c8968833e53d0929e76597b7143")
sha256sums_aarch64=("c3289fe4ca9df0fb9905677773ecdfde39bf94fbfd85af6b569eb2896a02139f")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

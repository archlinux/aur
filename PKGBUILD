# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=181.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/181.0.0-beta001-roam_181.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/181.0.0-beta001-roam_181.0.0-beta001_arm64.deb")
sha256sums_x86_64=("0c545ee48e2ca61b79598670756542439014b94345f6fc7d7d0f2ca365d99377")
sha256sums_aarch64=("e7e2f03b4d7beb2e6547d1cd17bcf9bb3dffd31690d29e8c97a82c89d9481641")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

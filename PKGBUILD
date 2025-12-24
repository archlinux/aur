# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=193.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/193.0.0-beta001-roam_193.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/193.0.0-beta001-roam_193.0.0-beta001_arm64.deb")
sha256sums_x86_64=("3476db79fec333dd54529b6ea7df1f8d0d9c72b4a8c90d0b52fd636cba9f66f0")
sha256sums_aarch64=("a60e5d84de85ff10a9508bd045e26b2f891d294879d94ce2e8d234e63e6c0b98")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

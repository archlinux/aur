# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=209.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/209.0.0-beta001-roam_209.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/209.0.0-beta001-roam_209.0.0-beta001_arm64.deb")
sha256sums_x86_64=("fcf935a7b6f993c53117f6d293181cb3376cebcb03374ced38e8dbe1d8276ca1")
sha256sums_aarch64=("cf622c8da135f0c85aea17eb5d625228019eb38c86608c00d32afe465d1cb873")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

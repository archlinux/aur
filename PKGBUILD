# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=231.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/231.0.0-beta001-roam_231.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/231.0.0-beta001-roam_231.0.0-beta001_arm64.deb")
sha256sums_x86_64=("1aac9e9905180c1e4237f1c8f9c204b316832150e45cc9dfbe330a1dad1ccac5")
sha256sums_aarch64=("1cb4e1258d49a49d65fd683f7b97459ac4627edbf270ad16529e2d1b0989564b")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=67.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/67.0.0-beta001-roam_67.0.0-beta001_amd64.deb")
sha256sums=("f95b04eb4f4fc76854df7bd2f40e93bed8f24c9b99fe3539c036ba8b582a07c4")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

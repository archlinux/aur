# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=75.3.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/75.3.0-beta001-roam_75.3.0-beta001_amd64.deb")
sha256sums=("5b9ba3cf29b7d56c90d76afd7c36c6a472bc85a157d47c52a79b8841efcdffd9")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

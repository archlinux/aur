# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=79.2.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/79.2.0-beta001-roam_79.2.0-beta001_amd64.deb")
sha256sums=("a6d656b86b68f432eaa6ca8cb8288e7633c4037fd92a7b5756e8037ac96fdac8")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

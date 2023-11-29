# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=85.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/85.0.0-beta001-roam_85.0.0-beta001_amd64.deb")
sha256sums=("c7398ba318e38be40536504fcbcffec6bfef53c5b64ee853c558b7abeba241e2")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

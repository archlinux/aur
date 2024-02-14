# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=96.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/96.0.0-beta001-roam_96.0.0-beta001_amd64.deb")
sha256sums=("9dfd4d7d29a240f03504655c839257b6a8082bc1ecaf92464f319877d97a6760")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=99.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/99.1.0-beta001-roam_99.1.0-beta001_amd64.deb")
sha256sums=("2592618ab5c267e664b3b9480a96e4ad1f4aff78682b87f4a9e713e03f6693e2")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

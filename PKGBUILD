# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=47.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/47.0.0-beta001-roam_47.0.0-beta001_amd64.deb")
sha256sums=("07eb4ff08a74eb2b4b19a294f3c33ca0cfa7efc00ee45125e7a2634b1ad13870")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=99.0.2.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/99.0.2-beta001-roam_99.0.2-beta001_amd64.deb")
sha256sums=("d797548f78c041a6a5f4bc9bad8355f11de28af318d5e164f1312e1eec3496ee")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

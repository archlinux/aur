# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=42.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Virtual HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/42.0.0-beta001-roam_42.0.0-beta001_amd64.deb")
sha256sums=("18eda0bb90b3eefe7748f01356d5a949442dcc2f921a1ac47b561130f1de8527")

prepare() {
    tar -xJf data.tar.xz
}

package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

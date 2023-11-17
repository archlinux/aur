# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=83.4.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/83.4.0-beta001-roam_83.4.0-beta001_amd64.deb")
sha256sums=("0e19d866a1e669cad5ecf78008eee4eefe8bc4b1eef0c1747675c8a5926966d4")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

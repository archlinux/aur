# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=63.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/63.1.0-beta001-roam_63.1.0-beta001_amd64.deb")
sha256sums=("7959c5ac48ec759367b824f32925a41098a275bd5f1775fd5d5f89c1ecd5b051")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

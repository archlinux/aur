# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=83.2.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/83.2.0-beta001-roam_83.2.0-beta001_amd64.deb")
sha256sums=("4af4ca3f8d73eb934ff026c502a91f10eac011f5a6f2ea3a4d2e869893eec485")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

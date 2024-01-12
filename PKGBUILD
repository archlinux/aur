# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=91.2.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/91.2.0-beta001-roam_91.2.0-beta001_amd64.deb")
sha256sums=("28aee030fc7ef6aab2389324896a9a89b54f0ea602f5a418b08f2e2f8182dcac")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

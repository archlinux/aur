# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=66.2.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/66.2.0-beta001-roam_66.2.0-beta001_amd64.deb")
sha256sums=("ad919d85598ebb393ee25b16848e0e05f4a177005634c6e9b5b24a87644c9eff")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

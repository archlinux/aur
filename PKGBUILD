# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=116.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/116.0.0-beta001-roam_116.0.0-beta001_amd64.deb")
sha256sums=("24c9aed67361fe3e75bc8c90120735a1c35986b50d77fc5d93f21a147ccd1a45")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

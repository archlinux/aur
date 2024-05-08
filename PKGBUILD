# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=108.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/108.0.0-beta001-roam_108.0.0-beta001_amd64.deb")
sha256sums=("9ddc6b659234e6302fd440523ee88c7865acc312b583ac9479b11b41f8e2d605")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

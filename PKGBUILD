# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=49.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/49.1.0-beta001-roam_49.1.0-beta001_amd64.deb")
sha256sums=("13c936522a8f9b138e9901258621a3234a45dbe5acb89a8f7c9b64ecd4b4cdf4")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

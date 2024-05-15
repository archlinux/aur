# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=109.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/109.1.0-beta001-roam_109.1.0-beta001_amd64.deb")
sha256sums=("fa8691da4a57b78867f823ebfb29c5790e8db87007f07fd8274bd18ce2781e9e")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

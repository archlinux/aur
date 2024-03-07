# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=99.2.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/99.2.0-beta001-roam_99.2.0-beta001_amd64.deb")
sha256sums=("388e58648561d4478c447df45d9ba46100f5b0ed1a86c74c9096f19973e08482")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

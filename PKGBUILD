# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=101.0.3.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/101.0.3-beta001-roam_101.0.3-beta001_amd64.deb")
sha256sums=("b1c7425526d323985200d7593916ebc462bb383ad68819dfbca2b70ff8b03841")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

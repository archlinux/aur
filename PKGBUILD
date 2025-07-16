# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=170.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/170.0.0-beta001-roam_170.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/170.0.0-beta001-roam_170.0.0-beta001_arm64.deb")
sha256sums_x86_64=("1c21a6e64cae0cc5b34dc628a93ca7cd9dd553a0ed0e9e18363bc654e6a73157")
sha256sums_aarch64=("e04e5054c887bd0ebd2595114e3b960aa5df8d8398ad277ee25e0159253f48a3")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

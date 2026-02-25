# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=202.0.4.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/202.0.4-beta001-roam_202.0.4-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/202.0.4-beta001-roam_202.0.4-beta001_arm64.deb")
sha256sums_x86_64=("2c879da32fc194d7ab006ffbb17b021d548d09a2118c2986be013ee4c7a6e5b3")
sha256sums_aarch64=("a0a3662c3b0282ae587b0d64c83ec1d116a1923cdaf2da922f9ad13b73a1df7b")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

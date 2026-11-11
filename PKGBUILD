# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=239.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/239.0.0-beta001-roam_239.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/239.0.0-beta001-roam_239.0.0-beta001_arm64.deb")
sha256sums_x86_64=("28dfa20acc752d295fb77c54c1d49db9a1ef5e218e0c78bbdac310077009684d")
sha256sums_aarch64=("b448efc5a28daf40191170e73f335b72fb778d72cc77c67d6ff29242f06654bd")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

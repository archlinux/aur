# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=186.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/186.0.0-beta001-roam_186.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/186.0.0-beta001-roam_186.0.0-beta001_arm64.deb")
sha256sums_x86_64=("a0ebefc1173a04194c61af296bce6a9ce400082aa82f65d14417b9448a48a7b9")
sha256sums_aarch64=("a2ce6e5bb4446a47e42e2bd49de750ef06640c3dfb1a79217c80d3666b4fba17")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

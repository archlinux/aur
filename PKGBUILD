# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=132.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/132.1.0-beta001-roam_132.1.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/132.1.0-beta001-roam_132.1.0-beta001_arm64.deb")
sha256sums_x86_64=("ad4420bc058a48fec47ab101c0886a7e80d9b1a36cec322ceb64dd331f7840de")
sha256sums_aarch64=("10e276338fd3e2051930f867b647dda090e715ecd632f2f32400f5202f6b167a")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=164.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/164.0.0-beta001-roam_164.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/164.0.0-beta001-roam_164.0.0-beta001_arm64.deb")
sha256sums_x86_64=("830d47956463bb70643617a4078b5738a14d4451944f80a20b3969c33111a02e")
sha256sums_aarch64=("1c5dca49c9f59cb1a25a232fac0eb76b14e6aa60f752a939bb5a9d876ec32cca")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

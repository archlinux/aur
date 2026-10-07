# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=234.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/234.0.0-beta001-roam_234.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/234.0.0-beta001-roam_234.0.0-beta001_arm64.deb")
sha256sums_x86_64=("5798db45a2fb3a46c12c1785eb56be462f2cfd8be5ef6f0e033b9e341b7d2ad1")
sha256sums_aarch64=("6d6896920ce5d90cd7f60af330afc5473e782e754bbe90efc24390428e60981d")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

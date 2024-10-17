# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=131.1.2.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/131.1.2-beta001-roam_131.1.2-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/131.1.2-beta001-roam_131.1.2-beta001_arm64.deb")
sha256sums_x86_64=("9705538ed270ad20d0c8a0972855d65e1afd4694caddf2e6b8e12fd237a8a510")
sha256sums_aarch64=("783ae6b0271bb39292b7366f67ad32978618a0aab59cb9c8bd6a3e4a8086d715")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

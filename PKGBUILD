# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=233.1.3.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/233.1.3-beta001-roam_233.1.3-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/233.1.3-beta001-roam_233.1.3-beta001_arm64.deb")
sha256sums_x86_64=("0375a6a6639f5e3ad7b515557ccb07b576dba8af0d3d9adba2b553d77f8a86a0")
sha256sums_aarch64=("b1be10e4454600cab260b6b6a9557f67737b8a159f2aef58eae313a1bfe9fb88")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

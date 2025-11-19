# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=188.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/188.0.0-beta001-roam_188.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/188.0.0-beta001-roam_188.0.0-beta001_arm64.deb")
sha256sums_x86_64=("51316de3f7e24af8f0f8cda943e9e7e11cd57104e6eb1eca13aca6cc64d954d5")
sha256sums_aarch64=("932883af76a2322b1071159bb93767f4067a9a753b1e94ba7e7fd39132784fa3")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

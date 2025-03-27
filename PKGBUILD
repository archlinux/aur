# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=154.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/154.0.1-beta001-roam_154.0.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/154.0.1-beta001-roam_154.0.1-beta001_arm64.deb")
sha256sums_x86_64=("6ef7235de82bb87ce65d00259c6973728518812c54899407163752a99fc43d1b")
sha256sums_aarch64=("d4b352f7534c7920e6685f0387eec63fbd88841fcda179f3227556de30f29157")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

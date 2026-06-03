# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=216.0.1.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/216.0.1-beta001-roam_216.0.1-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/216.0.1-beta001-roam_216.0.1-beta001_arm64.deb")
sha256sums_x86_64=("f10ceaeaf04be3fa8c3f4f85bf3106c4674231623e0d8d7f6b99c74cb5ffed0b")
sha256sums_aarch64=("324d52c24378417dfb4f05860218094d081271697f8bddc547073fb01f0fd540")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

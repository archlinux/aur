# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=150.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/150.0.0-beta001-roam_150.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/150.0.0-beta001-roam_150.0.0-beta001_arm64.deb")
sha256sums_x86_64=("b28dbe9e5a4b18ddfbfc05415cf932639a91bf3ade0fe3a88ace301da25d1bd4")
sha256sums_aarch64=("7d2a4d55f95c15a68100ed188ed68969e4d7ab30400ea7f9953b1f50d2120bcb")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

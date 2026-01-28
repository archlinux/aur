# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=198.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/198.0.0-beta001-roam_198.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/198.0.0-beta001-roam_198.0.0-beta001_arm64.deb")
sha256sums_x86_64=("1484086faa37e4f1fd09c1f991887b6f847bd51b2c0dbef1db1d1f3420a4cec9")
sha256sums_aarch64=("a928b0b91c77cd8d6e2382d035855185aa79579c6680d7de484ccf3c8d7dd988")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

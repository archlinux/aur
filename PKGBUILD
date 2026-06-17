# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=218.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/218.0.0-beta001-roam_218.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/218.0.0-beta001-roam_218.0.0-beta001_arm64.deb")
sha256sums_x86_64=("73764d8be71d5cc8bb1b49c8f5e37979e813c66ecf3a5f7ea4f26fd33eb4b9e1")
sha256sums_aarch64=("bc1187139a876db9ced4c84774f4d664a53ae01136a7c5164573f0f17af4cd9a")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

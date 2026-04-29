# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=211.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/211.0.0-beta001-roam_211.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/211.0.0-beta001-roam_211.0.0-beta001_arm64.deb")
sha256sums_x86_64=("6aae68c782519092b51c79fce07c7bed64528183e241ba7917492db41d2f5044")
sha256sums_aarch64=("4fa2d74fb28167a3c976da6772d6757dcdb79d5ea183bc2130f796a87d6f7483")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

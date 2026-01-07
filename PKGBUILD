# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=195.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/195.0.0-beta001-roam_195.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/195.0.0-beta001-roam_195.0.0-beta001_arm64.deb")
sha256sums_x86_64=("a555d682ca60934880894c42f6a541698996100f1e244b460b3ce851fa7fc58d")
sha256sums_aarch64=("13b93a944109de51fa6f9227c9c511647659d2c05063e6b79cd8f9589035ea09")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

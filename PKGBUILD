# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=194.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/194.0.0-beta001-roam_194.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/194.0.0-beta001-roam_194.0.0-beta001_arm64.deb")
sha256sums_x86_64=("ae4ee46d0cc7ce9461a39acf532a3c34bb9b8a9b68bfab880ecfd0b07199c0ba")
sha256sums_aarch64=("02232ab5967f7dbeacdb2745c2832dd760335d198dcea8974fae529fe98e1e79")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

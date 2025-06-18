# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=166.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/166.0.0-beta001-roam_166.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/166.0.0-beta001-roam_166.0.0-beta001_arm64.deb")
sha256sums_x86_64=("20a3576bebe59fd74258bd1f93e9cd75cd52e36a3da64fec487ea398365ef638")
sha256sums_aarch64=("d02e984f998900cb34e075ff318e6b0d947d220014e962a097e06161abc3a2f1")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

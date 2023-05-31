# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=60.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/60.0.0-beta001-roam_60.0.0-beta001_amd64.deb")
sha256sums=("1921935f7d155e08bde9781167a9c698e6375b3b659e6706e408a6d019b017ea")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

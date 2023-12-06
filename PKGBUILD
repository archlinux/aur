# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=86.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/86.0.0-beta001-roam_86.0.0-beta001_amd64.deb")
sha256sums=("3503d7f9d5e92ac6058ef3a7fe1cf8635c59a4698888aab8a3caf55e34077d17")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

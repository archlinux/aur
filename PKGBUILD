# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=68.2.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/68.2.0-beta001-roam_68.2.0-beta001_amd64.deb")
sha256sums=("1379baf9335a4f7f64ddd45a37b26ce419362e40afe4b47c018039cc5c7b9e40")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

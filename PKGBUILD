# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=75.2.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/75.2.0-beta001-roam_75.2.0-beta001_amd64.deb")
sha256sums=("032f6562ca41d99c86b901c1dbe258c30a79e3e7aee588f6d8694cbe5669e19b")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

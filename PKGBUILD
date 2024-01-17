# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=92.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/92.0.0-beta001-roam_92.0.0-beta001_amd64.deb")
sha256sums=("6c10a682b864b37c5cddbadd15935f5f5e7d8779eec428dca4f60ad818b4f6b9")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

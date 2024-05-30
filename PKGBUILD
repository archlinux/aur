# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=111.1.2.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/111.1.2-beta001-roam_111.1.2-beta001_amd64.deb")
sha256sums=("db3101366c5f5fc802067609b67746a4a765fcae7d18ca32d923d506127095b2")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

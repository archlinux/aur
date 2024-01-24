# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=93.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/93.0.0-beta001-roam_93.0.0-beta001_amd64.deb")
sha256sums=("63c6774a3e39f822b02f8b5b56d459a842ab1345fd5a1e6902713ea1df1bf150")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=127.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/127.0.0-beta001-roam_127.0.0-beta001_amd64.deb")
sha256sums=("ee8c52d58cb4a684bd490668388ac9c9487afc9fd2396b0eb1480a6c791d6df8")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

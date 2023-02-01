# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=43.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Virtual HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/43.0.0-beta001-roam_43.0.0-beta001_amd64.deb")
sha256sums=("25fecebc09b827f38bbb834a19c51b0113381565c7b691e6067238ac60c4b000")

prepare() {
    tar -xJf data.tar.xz
}

package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

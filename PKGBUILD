# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=61.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/61.0.0-beta001-roam_61.0.0-beta001_amd64.deb")
sha256sums=("e62ef630f48bbb26245eacc25e84c22adb420ec2bf0af63442998d7b82ff4218")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

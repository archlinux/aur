pkgname=roam
pkgver=44.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets')
source=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/44.0.0-beta001-roam_44.0.0-beta001_amd64.deb")
sha256sum=("2a09d2c1c7d5228091d68b93bc9c334efe74ad2cb9daa3356eb383da51521a89")
prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} ""
}

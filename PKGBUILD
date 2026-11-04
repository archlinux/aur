# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=238.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/238.0.0-beta001-roam_238.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/238.0.0-beta001-roam_238.0.0-beta001_arm64.deb")
sha256sums_x86_64=("e895535da2ffea6d608ee936fc3612ef1a2e482ce66b28a2beb8f222072c137b")
sha256sums_aarch64=("9e09215d5fa11c70c431a8cb26137d5d9a60e5bbb0ddc3be4700f5342d077e03")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=199.0.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/199.0.0-beta001-roam_199.0.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/199.0.0-beta001-roam_199.0.0-beta001_arm64.deb")
sha256sums_x86_64=("dd57dc15c93b0998ec71e6585aa3611ab2f54b8f45970b124a4662e1f9eb0202")
sha256sums_aarch64=("315fc660f15619f92a46670e51ef1ededee1690faf6f0ac43e01989bf470df26")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

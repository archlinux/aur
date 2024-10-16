# Maintainer: Roam <linux-packages at ro dot am>

pkgname=roam
pkgver=131.1.0.beta001
pkgrel=1
pkgdesc="Roam: Your Cloud HQ"
arch=('x86_64' 'aarch64')
url="https://ro.am"
license=('custom')
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils' 'libappindicator-gtk3' 'org.freedesktop.secrets' 'libpulse')
options=(!debug)
source_x86_64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/131.1.0-beta001-roam_131.1.0-beta001_amd64.deb")
source_aarch64=("https://download.ro.am/Roam/8a86d88cfc9da3551063102e9a4e2a83/linux/debian/binary/131.1.0-beta001-roam_131.1.0-beta001_arm64.deb")
sha256sums_x86_64=("21d58e7a1a29fca4f35fdb88c8d70bc259b8a87bbf74ce7300c401248f1ec9d1")
sha256sums_aarch64=("c81966dfe587491cee05b2524372483e22284d1954372bba713e8cad835d74e1")

prepare() {
    tar -xJf data.tar.xz
}
package() {
    cp --parents -a usr/{bin,lib/roam,share} "$pkgdir"
}

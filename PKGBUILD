# Maintainer: Pandakewt chuminhtuan30306@gmail.com
pkgname=teleport-connect
pkgver=17.5.2
pkgrel=1
pkgdesc="Teleport Connect"
arch=('x86_64')
url="https://goteleport.com"
license=('Apache')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux' 'libsecret')
optdepends=('libappindicator-gtk3')
source=("${pkgname}-${pkgver}.deb::https://cdn.teleport.dev/teleport-connect_${pkgver}_amd64.deb")
sha256sums=('cbd55468b6b1e6b60fd07c160dd158ffddd3e4b3a85bfecd300b7e8fd918e0b3')

package() {
    # Extract the DEB package
    bsdtar -Oxf "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.xz | bsdtar -xJf - -C "${pkgdir}"
}

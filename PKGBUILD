# Maintainer: Games_Crack aur@gamescrack.net
pkgname=teleport-connect
pkgver=15.1.1
pkgrel=1
pkgdesc="Teleport Connect"
arch=('x86_64')
url="https://goteleport.com"
license=('Apache')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux' 'libsecret')
optdepends=('libappindicator-gtk3')
source=("${pkgname}-${pkgver}.deb::https://cdn.teleport.dev/teleport-connect_${pkgver}_amd64.deb")
sha256sums=('fee5bff270977b59382fc9c07cf1eca92a4ef714d5a4d1dc5d0edee11266bab4')

package() {
    # Extract the DEB package
    bsdtar -Oxf "${srcdir}/${pkgname}-${pkgver}.deb" data.tar.xz | bsdtar -xJf - -C "${pkgdir}"
}

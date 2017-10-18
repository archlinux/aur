# Maintainer: Danilo <aur ät dbrgn döt ch>
pkgname=cura-appimage
pkgver=3.0.3
pkgrel=1
pkgdesc="Slicing software by Ultimaker. This is the binary AppImage version."
arch=('x86_64')
url="https://ultimaker.com/en/products/cura-software"
license=('AGPL3')
groups=()
depends=('glib2' 'fuse2')
makedepends=()
optdepends=()
provides=('cura')
source=("https://software.ultimaker.com/current/Cura-${pkgver}.AppImage")
noextract=("Cura-${pkgver}.AppImage")
sha256sums=('2f48d8fd078f8df4b431b0362918b36d8dbfdf9b3255daad1c88b6f266f7b6d2')
options=('!strip')

package() {
    mkdir -p ${pkgdir}/usr/bin/
    install -m 755 Cura-${pkgver}.AppImage ${pkgdir}/usr/bin/cura-appimage
}

# Maintainer: Danilo <aur ät dbrgn döt ch>
pkgname=cura-appimage
pkgver=3.0.4
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
sha256sums=('3b86fa9f68a1c837b2b941c6743c706db75a201bc0fe1358b234e251937cc3f9')
options=('!strip')

package() {
    mkdir -p ${pkgdir}/usr/bin/
    install -m 755 Cura-${pkgver}.AppImage ${pkgdir}/usr/bin/cura-appimage
}

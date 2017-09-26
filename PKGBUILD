# Maintainer: Danilo <aur ät dbrgn döt ch>
pkgname=cura-appimage
pkgver=2.7.0
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
sha256sums=('888fb2c926b3549059dd1cf16ec0790f4fb4e39f1f693416e686bad16b98610e')
options=('!strip')

package() {
    mkdir -p ${pkgdir}/usr/bin/
    install -m 755 Cura-${pkgver}.AppImage ${pkgdir}/usr/bin/cura-appimage
}

# Maintainer: Manuel Conzelmann <manolo89@online.de>
pkgname=system-image-script
pkgver=1
pkgrel=1
epoch=
pkgdesc="can be used to create a system image or compressed archive from any partition while excluding system specific directories like 'proc' and 'sys'. The backup has to be run from readonly / or a live system "
arch=(any)
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

package() {
        install -m 755 -d $pkgdir/usr/bin/
        install -p -m 755 system_image.sh $pkgdir/usr/bin/
}

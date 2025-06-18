# Maintainer: KDLoww <wsgsb555@outlook.com> | https://github.com/Pony-CW
# Contributor: Reylyer <reylyercross@shariyl.cloud> | https://github.com/Reylyer
# With the help of Thomas <thomas@vypxl.io>

# Package name
pkgname=linuxdeploy-appimage

# Version
_ver=1-alpha-20250213-2
pkgver=$(echo "${_ver}" | sed 's/-/./g')
pkgrel=1

# Generic
pkgdesc="AppDir creation and maintenance tool."
arch=('x86_64')
url="https://github.com/linuxdeploy/linuxdeploy"
license=('MIT')

# Dependencies
depends=(fuse2)

# Package relations
conflicts=("linuxdeploy")
provides=("linuxdeploy")

# Others
options=(!strip)

# Sources
source=("https://github.com/linuxdeploy/linuxdeploy/releases/download/${_ver}/linuxdeploy-${arch}.AppImage")
sha256sums=("4648f278ab3ef31f819e67c30d50f462640e5365a77637d7e6f2ad9fd0b4522a")


package() {
    install -Dm755 linuxdeploy-${arch}.AppImage ${pkgdir}/usr/bin/linuxdeploy
}

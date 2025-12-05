# Maintainer: KDLoww <wsgsb555@outlook.com> | https://github.com/Pony-CW
# Contributor: Reylyer <reylyercross@shariyl.cloud> | https://github.com/Reylyer
# With the help of Thomas <thomas@vypxl.io>

# Package name
pkgname=linuxdeploy-appimage

# Version
_ver=1-alpha-20251107-1
pkgver=$(echo "${_ver}" | sed 's/-/./g')
pkgrel=1

# Generic
pkgdesc="AppDir creation and maintenance tool. Featuring flexible plugin system. "
arch=('x86_64' 'i386' 'aarch64' 'armhf')
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
source_x86_64=("linuxdeploy-x86_64.AppImage::https://github.com/linuxdeploy/linuxdeploy/releases/download/${_ver}/linuxdeploy-${CARCH}.AppImage")
source_i386=("linuxdeploy-i386.AppImage::https://github.com/linuxdeploy/linuxdeploy/releases/download/${_ver}/linuxdeploy-${CARCH}.AppImage")
source_aarch64=("linuxdeploy-aarch64.AppImage::https://github.com/linuxdeploy/linuxdeploy/releases/download/${_ver}/linuxdeploy-${CARCH}.AppImage")
source_armhf=("linuxdeploy-armhf.AppImage::https://github.com/linuxdeploy/linuxdeploy/releases/download/${_ver}/linuxdeploy-${CARCH}.AppImage")
sha256sums_x86_64=('c20cd71e3a4e3b80c3483cef793cda3f4e990aca14014d23c544ca3ce1270b4d')
sha256sums_i386=('a2a88d142aac42db779483ca07c10dbf318b27f514691107fc88a202faae17b5')
sha256sums_aarch64=('620095110d693282b8ebeb244a95b5e911cf8f65f76c88b4b47d16ae6346fcff')
sha256sums_armhf=('e359161979fa4bee50b92ce7102fb510299caebf34f711d983fba7a8f4bb1c2e')


package() {
    install -Dm755 linuxdeploy-${arch}.AppImage ${pkgdir}/usr/bin/linuxdeploy
}

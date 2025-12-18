# Maintainer: Tyler Furby <tyler@theforge.xyz>
# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman
pkgver=27.1.2389102
pkgrel=1
pkgdesc="Proprietary photorealistic 3D rendering software produced by Pixar Animation Studios"
arch=('x86_64')
url="https://renderman.pixar.com"
license=('custom')
depends=('glibc' 'gcc-libs' 'xcb-util-keysyms' 'libxcomposite' 'xcb-util-image' 'libxcb'
         'libxext' 'xcb-util-wm' 'xcb-util-renderutil' 'freetype2' 'libdrm' 'libsm' 'dbus'
         'libglvnd' 'zlib' 'zstd' 'krb5' 'libxkbcommon-x11' 'libice' 'glib2' 'wayland'
         'fontconfig' 'libxkbcommon' 'libx11' 'icu67')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website")
source=("manual://RenderMan-InstallerNCR-27.1.0_2389102-linuxRHEL9_gcc11icx232.x86_64.rpm")
b2sums=('257c0f20da4254e9925c0cd1615346e7f3d31b75b5b0b8345d118873e306f18fdec6702c915db6ceffd74d4ad6d9a641a594280a857bfab8e750ad69218a0673')

package() {
    mv opt "$pkgdir/"
}


# Maintainer: Tyler Furby <tyler@theforge.xyz>
# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman
pkgver=26.3.2352291
pkgrel=2
pkgdesc="Proprietary photorealistic 3D rendering software produced by Pixar Animation Studios"
arch=('x86_64')
url="https://renderman.pixar.com"
license=('custom')
depends=('glibc' 'gcc-libs' 'xcb-util-keysyms' 'libxcomposite' 'xcb-util-image' 'libxcb'
         'libxext' 'xcb-util-wm' 'xcb-util-renderutil' 'freetype2' 'libdrm' 'libsm' 'dbus'
         'libglvnd' 'zlib' 'zstd' 'krb5' 'libxkbcommon-x11' 'libice' 'glib2' 'wayland'
         'fontconfig' 'libxkbcommon' 'libx11')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website")
source=("manual://RenderMan-InstallerNCR-26.3.0_2352291-linuxRHEL9_gcc11icx232.x86_64.rpm")
b2sums=('80afd6b06a0d1e42261e4eee56022fba4a27959f3c0351ffed660e837a700939c7e1c3a956d34fba012bc5a8743694b013f87dc162b3823510f4b04610aeaafb')

package() {
    mv opt "$pkgdir/"
}


# Maintainer: Tyler Furby <tyler@theforge.xyz>
# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman
pkgver=27.0.2386582
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
source=("manual://RenderMan-InstallerNCR-27.0.0_2386582-linuxRHEL9_gcc11icx232.x86_64.rpm")
b2sums=('1f454e5e4760954933e55f3d9003caa2fae4d661145de3e0a52275737c27899d5fd4b1da04ecdca0e715a89b3a869b21c8cb208ef2553ec53b35bd795070d214')

package() {
    mv opt "$pkgdir/"
}


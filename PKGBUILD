# Maintainer: pineappletoad

pkgname=go-configure-sw-hub-bin
pkgver=6.55.001
_pkgrel_src=1
pkgrel=1
pkgdesc="Renesas/Dialog/Silego Go Configure software hub (greenpak designer) (precompiled)"
arch=('x86_64')
url="https://www.renesas.com/us/en/software-tool/go-configure-software-hub"
license=('custom:Go_Configure_Software_Hub_Software_Licensing_Agreement')
options=('!debug')
provides=('go-configure-sw-hub')
conflicts=('go-configure-sw-hub' 'greenpak-designer-dev' 'greenpak-designer')
depends=(
    'alsa-lib'
    'dbus'
    'desktop-file-utils'
    'expat'
    'fontconfig'
    'freetype2'
    'gcc-libs'
    'glib2'
    'graphviz'
    'hicolor-icon-theme'
    'krb5'
    'libcups'
    'libdrm'
    'libglvnd'
    'libxshmfence'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxi'
    'libxkbcommon'
    'libxkbcommon-x11'
    'libxkbfile'
    'libxrandr'
    'libxrender'
    'libxtst'
    'nspr'
    'nss'
    'shared-mime-info'
    'systemd-libs'
    'xcb-util-cursor'
    'xcb-util-image'
    'xcb-util-keysyms'
    'xcb-util-renderutil'
    'xcb-util-wm'
    'zlib'
)

source=("https://github.com/tubbywrestler/go-configure-sw-hub-bin/releases/download/${pkgver}-${_pkgrel_src}/go-configure-sw-hub-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst")
sha256sums=('e27a778c0a7e1831d250c10b0e49902ae1520c2d7b87a7ee09585fb539505e47')

package() {
    bsdtar -xf "${srcdir}/go-configure-sw-hub-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst" -C "${pkgdir}" --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}

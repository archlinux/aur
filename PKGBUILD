# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=atuin-desktop-bin
pkgver=0.2.0
pkgrel=2
pkgdesc="Atuin Desktop: Runbooks that Run. A local-first, executable runbook editor for real terminal workflows"
arch=('x86_64')
url="https://github.com/atuinsh/desktop"
license=('Apache-2.0')
depends=(
    "cairo"
    "dbus"
    "fontconfig"
    "gcc-libs"
    "gdk-pixbuf2"
    "glib2"
    "glibc"
    "gtk3"
    "hicolor-icon-theme"
    "libsoup3"
    "pango"
    "webkit2gtk-4.1"
    "zlib"
)
makedepends=()
options=("!debug")

provides=("${pkgname%-bin}")

source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/Atuin_Desktop-${pkgver}-1.x86_64.rpm")

package() {
    cp -ar "${srcdir}/usr/" "${pkgdir}/usr/"
}

b2sums_x86_64=('506ee53a9ab5b0a05d568a88493d5ba3262c41fccce8f91fd352d69b094a44fa1613724f967b1599f6ab474a8a46df8581bf745075e7925b74ebd1405b23bbbe')

# vim:set ts=2 sw=2 et:

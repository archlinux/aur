# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=atuin-desktop-bin
pkgver=0.1.5
pkgrel=1
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

source_x86_64=("${pkgname}-x86_64::${url}/releases/download/v${pkgver}/Atuin_Desktop-${pkgver}-1.x86_64.rpm")

package() {
    cp -ar "${srcdir}/usr/" "${pkgdir}/usr/"
}

b2sums_x86_64=('8461272e00a657e60a21d3debf645b46a72b8d4a196ede1ee412e2430dc9b686d354497d5545ba5325369248fe0a3fec34b8116a058f72d68bceefd95470f01f')

# vim:set ts=2 sw=2 et:

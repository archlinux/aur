# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=atuin-desktop-bin
pkgver=0.2.14
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

source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/Atuin_Desktop-${pkgver}-1.x86_64.rpm")

package() {
    cp -ar "${srcdir}/usr/" "${pkgdir}/usr/"
}

b2sums_x86_64=('d270b007f2761a295b51e5268880e1bcc7743cd27b22fc05c006f9f84e27c5d7fc022987d61432e5be9137ee458f2f0c9b53fe2e4875193a0071c94361cf17cb')

# vim:set ts=2 sw=2 et:

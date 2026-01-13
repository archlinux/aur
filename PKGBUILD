# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=atuin-desktop-bin
pkgver=0.2.12
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

b2sums_x86_64=('1b942dc2ccbf8237a28f30d2ed3654e21e628900ac67d63abdfbfff30389bf23a43eb57526e219011babfbad185743095f01fb02ec98db5a45253ede550be923')

# vim:set ts=2 sw=2 et:

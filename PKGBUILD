# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=atuin-desktop-bin
pkgver=0.1.9
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

b2sums_x86_64=('5f89883ec4c9258060b2bbda82ee9d924b78294cc0299772b641a8833b1d066211f7d63ad437344b9fd037d4bd1b837671c1b5de1985f6c70ea13f66db488019')

# vim:set ts=2 sw=2 et:

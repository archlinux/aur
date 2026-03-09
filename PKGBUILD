# Maintainer: Magnus Pladsen <magnuspladsen@users.noreply.github.com>
pkgname=cheatsheet-app-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Developer keybinding cheatsheet for neovim, tmux, aerospace, and more"
arch=('x86_64')
url="https://github.com/MagnusPladsen/my-cheatsheet"
license=('MIT')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
)
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/cheatsheet_${pkgver}_amd64.deb")
sha256sums_x86_64=('0560e7286d45b31572c2e71393c153efb401202dcd2b98f652f4f24481cae24a')

package() {
  tar -xz -f data.tar.gz -C "${pkgdir}"
}

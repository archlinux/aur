# Maintainer: Magnus Pladsen <magnuspladsen@users.noreply.github.com>
pkgname=cheatsheet-app-bin
pkgver=1.1.9
pkgrel=1
pkgdesc="Developer keybinding cheatsheet for neovim, tmux, aerospace, and more"
arch=('x86_64')
url="https://github.com/MagnusPladsen/cheatsheet-app"
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
sha256sums_x86_64=('a3eae8f482b38d6428f2a7570813c7b0808e9814514fde16469de92fb813f9ac')

package() {
  tar -xz -f data.tar.gz -C "${pkgdir}"
}

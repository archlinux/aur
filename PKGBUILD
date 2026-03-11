# Maintainer: Magnus Pladsen <magnuspladsen@users.noreply.github.com>
pkgname=cheatsheet-app-bin
pkgver=1.1.2
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
sha256sums_x86_64=('c7414445184c4f08a987efca12101870b7f01f2de4ce4fb770e01ce7e24c362c')

package() {
  tar -xz -f data.tar.gz -C "${pkgdir}"
}

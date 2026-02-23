pkgname=excalidraw-svg-editor
pkgver=0.1.0
pkgrel=1
pkgdesc="Use Excalidraw to edit SVG files on your desktop (meant mainly for handwriting embedding in typst)"
arch=('x86_64')
url="https://github.com/NullSeile/excalidraw-svg-editor"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source_x86_64=("${url}/releases/download/v${pkgver}/Excalidraw.SVG.Editor_${pkgver}_amd64.deb")
sha256sums_x86_64=('6c4bd3c401d4fe1ad44f199ca66b802a2c797b1d50d7e950c796899906afd105')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}

pkgname=excalidraw-svg-editor
pkgver=0.1.1
pkgrel=1
pkgdesc="Use Excalidraw to edit SVG files on your desktop (meant mainly for handwriting embedding in typst)"
arch=('x86_64')
url="https://github.com/NullSeile/excalidraw-svg-editor"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source_x86_64=("${url}/releases/download/v${pkgver}/Excalidraw.SVG.Editor_${pkgver}_amd64.deb")
sha256sums_x86_64=('5ee052ae44f24e30d3b5feaf2ed2a74e9b85a532adfc2415cfb9edc70bcac648')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}

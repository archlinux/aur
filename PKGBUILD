# Maintainer: Sakura Yumine <i@nanoka.top>

pkgname="pixiv-viewer"
pkgver=$(curl -s https://api.github.com/repos/asadahimeka/pixiv-viewer-app/releases/latest | grep '"tag_name":' | cut -d '"' -f 4 | sed 's/^v//')
pkgrel=1
pkgdesc="Yet Another Pixiv Illust&Novel Viewer / 又一个 Pixiv 阅览工具"
arch=('x86_64')
url="https://github.com/asadahimeka/pixiv-viewer-app"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/asadahimeka/pixiv-viewer-app/releases/download/v${pkgver}/Pixiv-Viewer_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}


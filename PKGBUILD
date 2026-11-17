# Maintainer: Mohammad Ashar Khan <ashar786khan@gmail.com>

pkgname=llama-recipe-manager
pkgver=0.5.0
pkgrel=1
pkgdesc="A native desktop application for managing and launching llama-server with named recipes of command-line flags"
arch=('x86_64')
url="https://github.com/Llama-Recipe-Manager/llama-recipe-manager"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
install=${pkgname}.install

source=("https://github.com/Llama-Recipe-Manager/llama-recipe-manager/releases/download/v${pkgver}/Llama.Recipe.Manager_${pkgver}_amd64.deb")

sha256sums=('014028a0f2ce08910938820601ab7ea70ac1a8c337d982d8cb2f8e314e2b9a28')

package() {
    tar -xzf data.tar.gz -C "${pkgdir}"
}

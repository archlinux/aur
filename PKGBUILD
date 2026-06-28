# Maintainer: Mohammad Ashar Khan <ashar786khan@gmail.com>

pkgname=llama-recipe-manager
pkgver=0.3.0
pkgrel=1
pkgdesc="A native desktop application for managing and launching llama-server with named recipes of command-line flags"
arch=('x86_64')
url="https://github.com/Llama-Recipe-Manager/llama-recipe-manager"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
install=${pkgname}.install

source=("https://github.com/Llama-Recipe-Manager/llama-recipe-manager/releases/download/v${pkgver}/Llama.Recipe.Manager_${pkgver}_amd64.deb")

sha256sums=('edadbb39a31aa6b880ef7c3dbace2e9f854868eb81038d830fb48be6a6f8c595')

package() {
    tar -xzf data.tar.gz -C "${pkgdir}"
}

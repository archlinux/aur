# Maintainer: Krishna Biradar <cod3ncoff33@gmail.com>

pkgname=tranzit
pkgver=0.3.0
pkgrel=2
pkgdesc="A cross-platform app to share files on your local network."
arch=('x86_64' 'aarch64')
url="https://github.com/kr5hn4/tranzit"
license=('Apache-2.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
provides=('tranzit')
source=("https://github.com/kr5hn4/tranzit/releases/latest/download/tranzit_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"
    ar x tranzit_${pkgver}_amd64.deb
    tar -xzf data.tar.gz -C "${pkgdir}" # Extract actual files into pkgdir
}

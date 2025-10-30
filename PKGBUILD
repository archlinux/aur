# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.9.43
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.9.43/ChatWise_0.9.43_amd64_linux.deb")
sha256sums=('b49d291fe4a60b0767aa450cdbcd8665426f1acd68f967f5c91bfc49ed140828')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

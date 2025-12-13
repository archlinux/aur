# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.9.68
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.9.68/ChatWise_0.9.68_amd64.deb")
sha256sums=('ce72a32682f6d696da61cf7e04e386880b6bf01acdc23825b034cf4677333664')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

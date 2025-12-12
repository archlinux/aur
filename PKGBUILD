# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.9.65
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.9.65/ChatWise_0.9.65_amd64.deb")
sha256sums=('0c48647b2d85ac4d3bb0c44e66e396d946372fd92aea62490ee6f6c0424e2b78')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

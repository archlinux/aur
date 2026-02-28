# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.10.1
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.10.1/ChatWise_0.10.1_amd64.deb")
sha256sums=('b4dc18233450dfe80c9a09eb5f353a470ebabea983cd9f29b3e725ca48c4c461')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

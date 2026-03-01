# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.10.4
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.10.4/ChatWise_0.10.4_amd64.deb")
sha256sums=('a4a115234f41244d723cb516d9b4ff9a58090fe252d40b10a4bdf428ae7a5181')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

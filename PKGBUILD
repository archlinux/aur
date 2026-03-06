# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.10.6
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.10.6/ChatWise_0.10.6_amd64.deb")
sha256sums=('bec0c323c2c638e8a0999815a37238b794c3af9f4924ce07be96a46efb39a94f')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

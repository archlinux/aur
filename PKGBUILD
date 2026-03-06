# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.10.7
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.10.7/ChatWise_0.10.7_amd64.deb")
sha256sums=('739c113470d8f12f7408378e436b5fc4a08f22f70dcbc6facfe933f446294b43')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.10.2
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.10.2/ChatWise_0.10.2_amd64.deb")
sha256sums=('e2571cd052cccbf4acc60e49b7a040d030fe5bc0045a79352e8c3b2a1fecb003')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

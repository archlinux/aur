# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.10.5
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.10.5/ChatWise_0.10.5_amd64.deb")
sha256sums=('4787241061bbbaa2ba87b53b8515bf89804fedd2a6b2f75f86cbee9c13e4a359')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

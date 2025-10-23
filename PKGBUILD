# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.9.38
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://gh-releases.chatwise.app/egoist/chatwise-releases/v${pkgver}/ChatWise_${pkgver}_amd64.deb")
sha256sums=('b75c4ccf06f4a73d6fe4dd98f1aa2d61e862232ce7b6c23e3fc7aa6ad382a58d')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}
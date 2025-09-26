# Maintainer: charlie <github.com/381181295>
pkgname=chatwise
pkgver=0.9.22
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://gh-releases.chatwise.app/egoist/chatwise-releases/v${pkgver}/ChatWise_${pkgver}_amd64.deb")
sha256sums=('aa09166c2ae1d9cb1555d85b30acefab0cc989e41e13298b0c38b41301c5ff35')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

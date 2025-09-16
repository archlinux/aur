# Maintainer: charlie <github.com/381181295>
pkgname=chatwise
pkgver=0.9.19
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://gh-releases.chatwise.app/egoist/chatwise-releases/v${pkgver}/ChatWise_${pkgver}_amd64.deb")
sha256sums=('7d00eba7763ea27490f0f8c014865d7e1bd39a156def7ef7f4a288d808af5958')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

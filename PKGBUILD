# Maintainer: charlie <github.com/381181295>
pkgname=chatwise
pkgver=0.9.15
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://gh-releases.chatwise.app/egoist/chatwise-releases/v${pkgver}/ChatWise_${pkgver}_amd64.deb")
sha256sums=('acd77a8e471073623601dc955ab757849c731632017fac49e654b9f5c26d6704')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

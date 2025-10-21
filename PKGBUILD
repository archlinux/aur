# Maintainer: charlie <github.com/381181295>
pkgname=chatwise
pkgver=0.9.37
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://gh-releases.chatwise.app/egoist/chatwise-releases/v${pkgver}/ChatWise_${pkgver}_amd64.deb")
sha256sums=('f1152cc9a5bede3633ab70483d3df87a0be5bd50c6b87f0e0d333b34a00cb1ea')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

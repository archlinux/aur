# Maintainer: Yuzu Vita <g311571057 at gmail dot com>
pkgname=chatwise
pkgver=0.9.1
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://gh-releases.chatwise.app/egoist/chatwise-releases/v${pkgver}/ChatWise_${pkgver}_amd64.deb")
sha256sums=('3b412de2bb38f13b52cac971104a5ccc294b057c045f46171488d9431e73bd5c')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

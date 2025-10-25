# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.9.40
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://gh-releases.chatwise.app/egoist/chatwise-releases/v${pkgver}/ChatWise_${pkgver}_amd64.deb")
sha256sums=('ec4393c1df0f7203907dd95976a4cba23431d237f35209d849314e427f95d1ff')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}
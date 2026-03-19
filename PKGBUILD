# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.10.8
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.10.8/ChatWise_0.10.8_amd64.deb")
sha256sums=('ae12e637dad7e160bdd3faf9158b6bff3e26d6b099218d6efd06f456b0d9b628')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.9.46
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.9.46/ChatWise_0.9.46_amd64_linux.deb")
sha256sums=('193ac8d3f201a873f6d1e8542d3e6469084a93d658a7f62ebdb4910b3c5391aa')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

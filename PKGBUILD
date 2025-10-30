# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.9.44
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.9.44/ChatWise_0.9.44_amd64_linux.deb")
sha256sums=('ad624e9efbd833d9995ef4ef74d7cdac12a4cb37897ffd8e0115f82656950b8b')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.9.66
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.9.66/ChatWise_0.9.66_amd64.deb")
sha256sums=('0fde15a360e02dceea2ba6ca587c824eb3aabf248a61f5c27de8fce4cc5f5a2c')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

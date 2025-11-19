# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.9.56
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.9.56/ChatWise_0.9.56_amd64.deb")
sha256sums=('818a47b0f93cd632d1ea84830c493555bc8ca32587b6cb41ef495d79ddc3b0ce')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

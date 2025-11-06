# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.9.48
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.9.48/ChatWise_0.9.48_amd64_linux.deb")
sha256sums=('5b50a8fe4c203b043ff96186ca0d5de16ae1bd4778bcf479efea7d477d8dee6f')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

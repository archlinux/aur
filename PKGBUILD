# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.9.47
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.9.47/ChatWise_0.9.47_amd64_linux.deb")
sha256sums=('97e8a3954ddc6b665c8cc73f5828632a598a5440c4be09fc6b1b06ca3034a60c')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

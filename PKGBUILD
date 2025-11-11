# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.9.53
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://github.com/egoist/chatwise-releases/releases/download/v0.9.53/ChatWise_0.9.53_amd64_linux.deb")
sha256sums=('5606645d590731ea5a4dbf7d3890e3fc64e95449345f0dbe0bd59edbcd7d2fda')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

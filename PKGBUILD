# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=0.9.42
pkgrel=1
pkgdesc="The second fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(cairo gdk-pixbuf2 glib2 gtk3 hicolor-icon-theme libsoup pango webkit2gtk-4.1 openssl libappindicator-gtk3)
options=(!strip !debug)
source=("https://gh-releases.chatwise.app/egoist/chatwise-releases/v${pkgver}/ChatWise_${pkgver}_amd64_linux.deb")
sha256sums=('b80b7c999e6eabd3dd240d9171bfbe3a78ff9a0ec9c05f3bc18c246093b45363')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}

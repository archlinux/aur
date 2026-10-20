# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=26.9.1
pkgrel=1
pkgdesc="The fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret hicolor-icon-theme libappindicator-gtk3)
options=(!strip !debug)
source=("https://releases.chatwise.app/26.9.1/ChatWise-26.9.1.deb")
sha256sums=('f61fcad927534af43f4f65a0cc513acd10b5dca851bcfea86a1a3aceb9172e74')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/ChatWise/ChatWise "${pkgdir}/usr/bin/chatwise"
}

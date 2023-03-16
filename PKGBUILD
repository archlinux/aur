# Maintainer:smorks <smorks@40to.ca>
pkgname=keepass-natmsg
pkgver=2.0.16
pkgrel=1
epoch=
pkgdesc="KeePass plugin to expose credentials securely to a browser using Native Messaging"
arch=('any')
url="https://github.com/smorks/keepassnatmsg"
license=('GPL3')
depends=('keepass')
source=("https://github.com/smorks/keepassnatmsg/releases/download/v$pkgver/KeePassNatMsg.plgx")
sha256sums=('f969a1ba321648e6960f1a27661e9d07eeb8e01d6eb20f24f7adc216700f8d16')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 "${srcdir}"/KeePassNatMsg.plgx "${pkgdir}"/usr/share/keepass/plugins/
}

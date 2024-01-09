# Maintainer:smorks <smorks@40to.ca>
pkgname=keepass-natmsg
pkgver=2.0.17
pkgrel=1
epoch=
pkgdesc="KeePass plugin to expose credentials securely to a browser using Native Messaging"
arch=('any')
url="https://github.com/smorks/keepassnatmsg"
license=('GPL3')
depends=('keepass')
source=("KeePassNatMsg-$pkgver.plgx::https://github.com/smorks/keepassnatmsg/releases/download/v$pkgver/KeePassNatMsg.plgx")
sha256sums=('921e4fa9864e4ecdfb28ff6e9a84c9af78c8df8ef42a5bb373bffe55304f2e65')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 "${srcdir}"/KeePassNatMsg-$pkgver.plgx "${pkgdir}"/usr/share/keepass/plugins/KeePassNatMsg.plgx
}

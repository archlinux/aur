# Maintainer:F43nd1r <support@faendir.com>
pkgname=keepass-natmsg
pkgver=2.0.9
pkgrel=1
epoch=
pkgdesc="KeePass plugin to expose credentials securely to a browser using Native Messaging"
arch=('any')
url="https://github.com/smorks/keepassnatmsg"
license=('GPL3')
depends=('keepass')
source=("https://github.com/smorks/keepassnatmsg/releases/download/v$pkgver/KeePassNatMsg-v$pkgver-binaries.zip")
sha256sums=("537c74f0a8b56f6f22f2c28687f3992c0190bb5e91fa8dcb28a24828b47f546d")

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 "${srcdir}"/KeePassNatMsg/KeePassNatMsg.dll "${pkgdir}"/usr/share/keepass/plugins/
    install -m644 "${srcdir}"/KeePassNatMsg/Mono.Posix.dll "${pkgdir}"/usr/share/keepass/plugins/
    install -m644 "${srcdir}"/KeePassNatMsg/Newtonsoft.Json.dll "${pkgdir}"/usr/share/keepass/plugins/
}

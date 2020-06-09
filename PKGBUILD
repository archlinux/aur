# Maintainer:F43nd1r <support@faendir.com>
pkgname=keepass-natmsg
pkgver=2.0.10
pkgrel=1
epoch=
pkgdesc="KeePass plugin to expose credentials securely to a browser using Native Messaging"
arch=('any')
url="https://github.com/smorks/keepassnatmsg"
license=('GPL3')
depends=('keepass')
source=("https://github.com/smorks/keepassnatmsg/releases/download/v$pkgver/KeePassNatMsg-v$pkgver-binaries.zip")
sha256sums=("b615f5fd3e4ed9acbf930f66040ab26f161187f480122f8a4d172c066ef50c4f")

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 "${srcdir}"/KeePassNatMsg/KeePassNatMsg.dll "${pkgdir}"/usr/share/keepass/plugins/
    install -m644 "${srcdir}"/KeePassNatMsg/Mono.Posix.dll "${pkgdir}"/usr/share/keepass/plugins/
    install -m644 "${srcdir}"/KeePassNatMsg/Newtonsoft.Json.dll "${pkgdir}"/usr/share/keepass/plugins/
}

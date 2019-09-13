# Maintainer:F43nd1r <support@faendir.com>
pkgname=keepass-natmsg
pkgver=2.0.6
pkgrel=1
epoch=
pkgdesc="KeePass plugin to expose credentials securely to a browser using Native Messaging"
arch=('any')
url="https://github.com/smorks/keepassnatmsg"
license=('GPL3')
depends=('keepass')
source=("https://github.com/smorks/keepassnatmsg/releases/download/v2.0.6/KeePassNatMsg-v2.0.6-binaries.zip")
md5sums=("2b227b21de879d1c7e742e051933cfba")

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 "${srcdir}"/KeePassNatMsg/KeePassNatMsg.dll "${pkgdir}"/usr/share/keepass/plugins/
    install -m644 "${srcdir}"/KeePassNatMsg/Mono.Posix.dll "${pkgdir}"/usr/share/keepass/plugins/
    install -m644 "${srcdir}"/KeePassNatMsg/Newtonsoft.Json.dll "${pkgdir}"/usr/share/keepass/plugins/
}

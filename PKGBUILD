# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_pkgname=HaveIBeenPwned
pkgname=keepass-plugin-haveibeenpwned
pkgver=1.3.1
pkgrel=1
pkgdesc='KeePass plugin to check all entries with URLs against the "Have I Been Pwned?" and Cloudbleed breach list'
license=('MIT')
depends=('keepass')
arch=('any')
url="https://github.com/andrew-schofield/keepass2-haveibeenpwned"
source=("https://github.com/andrew-schofield/keepass2-haveibeenpwned/raw/master/HaveIBeenPwned.plgx")
sha512sums=('5d8fd4e577dfd2683512c6c6b80ad805586ea6c2b1450e2872f82df9f810bec64a745b919d21073d770815e15c0122f6f299ded2dec0401e307aeff111dbe18f')

package() {
    install -Dm644 "${srcdir}"/HaveIBeenPwned.plgx "${pkgdir}"/usr/share/keepass/plugins/HaveIBeenPwned.plgx
}

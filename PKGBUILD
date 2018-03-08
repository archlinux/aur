# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_pkgname=HaveIBeenPwned
pkgname=keepass-plugin-haveibeenpwned
pkgver=1.2.4
pkgrel=1
pkgdesc='KeePass plugin to check all entries with URLs against the "Have I Been Pwned?" and Cloudbleed breach list'
license=('MIT')
depends=('keepass')
arch=('any')
url="https://github.com/andrew-schofield/keepass2-haveibeenpwned"
source=("https://github.com/andrew-schofield/keepass2-haveibeenpwned/raw/master/HaveIBeenPwned.plgx")
sha512sums=('135818edd630d6b98f0125b9ac67300f162855dd7f38c6b727fe3109dc50a9f4fef0eb46773dc720e23be63f36ea50abce7c4f58982071b2994e7dc866c61764')

package() {
    install -Dm644 "${srcdir}"/HaveIBeenPwned.plgx "${pkgdir}"/usr/share/keepass/plugins/HaveIBeenPwned.plgx
}

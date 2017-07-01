# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_pkgname=HaveIBeenPwned
pkgname=keepass-plugin-haveibeenpwned
pkgver=1.0
pkgrel=1
pkgdesc='KeePass plugin to check all entries with URLs against the "Have I Been Pwned?" and Cloudbleed breach list'
license=('MIT')
depends=('keepass')
arch=('any')
url="https://github.com/andrew-schofield/keepass2-haveibeenpwned"
source=("https://github.com/andrew-schofield/keepass2-haveibeenpwned/releases/download/v${pkgver}/${_pkgname}.plgx")
sha512sums=('5d06f468f9452c1fdf119ee13abfcdc545aa8723b4ed5f6db231c4006d11a532e64dec73259b4ca76dca6289150b6357862887c58e748b71f65508e9c71d1fb9')

package() {
    install -Dm644 "${srcdir}"/${_pkgname}.plgx "${pkgdir}"/usr/share/keepass/plugins/${_pkgname}.plgx
}

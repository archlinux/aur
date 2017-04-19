# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_pkgname=HaveIBeenPwned
pkgname=keepass-plugin-haveibeenpwned
pkgver=0.2.9.2
pkgrel=1
pkgdesc='KeePass plugin to check all entries with URLs against the "Have I Been Pwned?" and Cloudbleed breach list'
license=('MIT')
depends=('keepass')
arch=('any')
url="https://github.com/andrew-schofield/keepass2-haveibeenpwned"
source=("https://github.com/andrew-schofield/keepass2-haveibeenpwned/releases/download/v${pkgver}/${_pkgname}.plgx")
sha512sums=('ce7dbc07422e2d23b1cc2f9d11c9d09b3989d0be10c2afdb400dc07dfd7937963318df65a9d89d733545f89c1d57489ce0905407886e8cb91cb13fba4bb3d948')

package() {
    install -Dm644 "${srcdir}"/${_pkgname}.plgx "${pkgdir}"/usr/share/keepass/plugins/${_pkgname}.plgx
}

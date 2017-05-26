# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_pkgname=HaveIBeenPwned
pkgname=keepass-plugin-haveibeenpwned
pkgver=0.3.1
pkgrel=1
pkgdesc='KeePass plugin to check all entries with URLs against the "Have I Been Pwned?" and Cloudbleed breach list'
license=('MIT')
depends=('keepass')
arch=('any')
url="https://github.com/andrew-schofield/keepass2-haveibeenpwned"
source=("https://github.com/andrew-schofield/keepass2-haveibeenpwned/releases/download/v${pkgver}/${_pkgname}.plgx")
sha512sums=('a59a0efab76cdcca549c264320fd15847cc4cd379bc8223427009aaacb14aa50cd502940574055290be644a122346af5be1da0786073c23faa2409bf0018f472')

package() {
    install -Dm644 "${srcdir}"/${_pkgname}.plgx "${pkgdir}"/usr/share/keepass/plugins/${_pkgname}.plgx
}

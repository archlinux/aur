# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_pkgname=HaveIBeenPwned
pkgname=keepass-plugin-haveibeenpwned
pkgver=1.2.3
pkgrel=1
pkgdesc='KeePass plugin to check all entries with URLs against the "Have I Been Pwned?" and Cloudbleed breach list'
license=('MIT')
depends=('keepass')
arch=('any')
url="https://github.com/andrew-schofield/keepass2-haveibeenpwned"
source=("https://github.com/andrew-schofield/keepass2-haveibeenpwned/raw/master/HaveIBeenPwned.plgx")
sha512sums=('f57eb0857728c6bd27fb0f883a6009643b324e020476fb029189acefdafa2aa2cb498c7dbad2301ccc4c7aa11e9ed3b2dc605dd6c774c0e3402aea767fc69545')

package() {
    install -Dm644 "${srcdir}"/HaveIBeenPwned.plgx "${pkgdir}"/usr/share/keepass/plugins/HaveIBeenPwned.plgx
}

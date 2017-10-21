# Maintainer: American_Jesus <american.jesus.pt AT gmail DOT com>

_pkgname=HaveIBeenPwned
pkgname=keepass-plugin-haveibeenpwned
pkgver=1.2.1
pkgrel=1
pkgdesc='KeePass plugin to check all entries with URLs against the "Have I Been Pwned?" and Cloudbleed breach list'
license=('MIT')
depends=('keepass')
arch=('any')
url="https://github.com/andrew-schofield/keepass2-haveibeenpwned"
source=("https://github.com/andrew-schofield/keepass2-haveibeenpwned/raw/master/mono/HaveIBeenPwned.dll"
        "https://github.com/andrew-schofield/keepass2-haveibeenpwned/raw/master/mono/Newtonsoft.Json.dll"
        "https://github.com/andrew-schofield/keepass2-haveibeenpwned/raw/master/mono/keepass2-developerextensions.dll")
sha512sums=('c9b020cbd14e0a1e09dda2e46167865eaee264dd95b323c0c2321a63d128e19a58e15eab0bec86b96d38f096b6579a89d0006622f39998824537fbfa343f0dae'
            '96754c8a846311ca59f8ec38185c2a204017bc8bc73bae1fdee63b66f3cc459017ed34ca164b53d625abfae683683b278e1aaa66346023018411ae70fe9e8059'
            '02563d4d42b4c967815156ac66cce4c03100fc9413a58f4cd585953d8189fab263c34e50548ccde9beb4fb533fc6014936d3675a8118653a9074f44013077fe0')

package() {
    install -Dm644 "${srcdir}"/HaveIBeenPwned.dll "${pkgdir}"/usr/share/keepass/plugins/HaveIBeenPwned.dll
    install -Dm644 "${srcdir}"/Newtonsoft.Json.dll "${pkgdir}"/usr/share/keepass/plugins/Newtonsoft.Json.dll
    install -Dm644 "${srcdir}"/keepass2-developerextensions.dll "${pkgdir}"/usr/share/keepass/plugins/keepass2-developerextensions.dll
}

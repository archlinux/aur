# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>
# Previoius Maintainer: Adam S Levy <adam@aslevy.com>

pkgname=modpoll-bin
_pkgname=modpoll
pkgver=3.11
pkgrel=1
pkgdesc="A command line based Modbus master simulator and test utility."
arch=("x86_64")
url="https://www.modbusdriver.com/$_pkgname.html"
license=('custom')
provides=("$_pkgname")
source=("https://www.modbusdriver.com/downloads/$_pkgname.$pkgver.tgz")
sha256sums=('3c97066638b581b0a85bd164ffd4f283e4a97287d4ee5f3a5c2614d76130e880')

package() {
        cd "$srcdir/$_pkgname"
        install -Dm755 x86_64-linux-gnu/$_pkgname "$pkgdir/usr/bin/$_pkgname"
        install -Dm644 LICENSE-FREE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

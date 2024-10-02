# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>
# Previoius Maintainer: Adam S Levy <adam@aslevy.com>

pkgname=modpoll-bin
_pkgname=modpoll
pkgver=3.15
pkgrel=1
pkgdesc="A command line based Modbus master simulator and test utility."
arch=("x86_64")
url="https://www.modbusdriver.com/$_pkgname.html"
license=('custom')
provides=("$_pkgname")
changelog="CHANGELOG"
source=("https://www.modbusdriver.com/downloads/$_pkgname.$pkgver.tgz")
b2sums=('a21e681cbc37399a3e7b33baa4284c0920e88320a27a832ee437de400c8224f31088b2045e47ec4332ea9d10cdd2027454c1a4b6105b12fb1ba6cef8cbf2febc')

package() {
        cd "$srcdir/$_pkgname"
        install -Dm755 x86_64-linux-gnu/$_pkgname "$pkgdir/usr/bin/$_pkgname"
        install -Dm644 LICENSE-FREE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>
# Previoius Maintainer: Adam S Levy <adam@aslevy.com>

pkgname=modpoll-bin
_pkgname=modpoll
pkgver=3.16
pkgrel=1
pkgdesc="A command line based Modbus master simulator and test utility."
arch=("x86_64")
url="https://www.modbusdriver.com/$_pkgname.html"
license=('custom')
provides=("$_pkgname")
changelog="CHANGELOG"
source=("https://www.modbusdriver.com/downloads/$_pkgname.$pkgver.tgz")
b2sums=('0e27da63d1db242761a7b314dc9ae270b4020934871167aba66bf3d49b9d8b5b67a63f9159514bb0843a62473883c597ecac9347b0da26f4ea4a0d8e75149554')

package() {
        cd "$srcdir/$_pkgname"
        install -Dm755 x86_64-linux-gnu/$_pkgname "$pkgdir/usr/bin/$_pkgname"
        install -Dm644 LICENSE-FREE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

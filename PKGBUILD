# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>
# Previoius Maintainer: Adam S Levy <adam@aslevy.com>

pkgname=modpoll-bin
_pkgname=modpoll
pkgver=3.13
pkgrel=1
pkgdesc="A command line based Modbus master simulator and test utility."
arch=("x86_64")
url="https://www.modbusdriver.com/$_pkgname.html"
license=('custom')
provides=("$_pkgname")
changelog="CHANGELOG"
source=("https://www.modbusdriver.com/downloads/$_pkgname.$pkgver.tgz")
b2sums=('2a838badd6a50ba8a4bc3c7862219679a1d2d3a07ce33b0ab4791bd692831a4225779ee18750558d3dd10c2f6f681d2f71170dacda49220c1204f4a601f3d0cf')

package() {
        cd "$srcdir/$_pkgname"
        install -Dm755 x86_64-linux-gnu/$_pkgname "$pkgdir/usr/bin/$_pkgname"
        install -Dm644 LICENSE-FREE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

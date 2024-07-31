# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>
# Previoius Maintainer: Adam S Levy <adam@aslevy.com>

pkgname=modpoll-bin
_pkgname=modpoll
pkgver=3.12
pkgrel=1
pkgdesc="A command line based Modbus master simulator and test utility."
arch=("x86_64")
url="https://www.modbusdriver.com/$_pkgname.html"
license=('custom')
provides=("$_pkgname")
changelog="CHANGELOG"
source=("https://www.modbusdriver.com/downloads/$_pkgname.$pkgver.tgz")
b2sums=('f5c550cbb2b22495bd377e05721e4174c5ed45882c8ec2023a2460e2defa290a69517261654242e5df5e6c4dcbc6a32a0f355497926cf11ee40fc01cc3b9000e')

package() {
        cd "$srcdir/$_pkgname"
        install -Dm755 x86_64-linux-gnu/$_pkgname "$pkgdir/usr/bin/$_pkgname"
        install -Dm644 LICENSE-FREE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

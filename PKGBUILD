# Maintainer: Adam S Levy <adam@aslevy.com>
pkgname=modpoll-bin
_pkgname=modpoll
pkgver=3.6
pkgrel=1
pkgdesc="A command line based Modbus master simulator and test utility."
arch=("x86_64")
url="https://www.modbusdriver.com/$_pkgname.html"
license=('custom')
provides=("$_pkgname")
source=("https://www.modbusdriver.com/downloads/$_pkgname.$pkgver.tgz")
sha256sums=('9742d87f30a7ab59a391b9afd15d3257efcf6118679bd15bbeee2ecf8d6bb642')

package() {
        cd "$srcdir/$_pkgname"
        install -Dm755 linux_x86-64/$_pkgname "$pkgdir/usr/bin/$_pkgname"
        install -Dm644 LICENSE-FREE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

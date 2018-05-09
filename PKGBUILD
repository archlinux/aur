# Maintainer: Adam S Levy <adam@aslevy.com>
pkgname=modpoll-bin
_pkgname=modpoll
pkgver=3.4
pkgrel=1
pkgdesc="A command line based Modbus master simulator and test utility."
arch=("x86_64")
url="https://www.modbusdriver.com/$_pkgname.html"
license=('custom')
provides=("$_pkgname")
source=("https://www.modbusdriver.com/downloads/$_pkgname.$pkgver.zip")
sha256sums=('9150318a70d90510f87f53a338dc814af401e27e97c9617d22d024c668c88822')

package() {
        cd "$srcdir"
        install -Dm755 linux/$_pkgname "$pkgdir/usr/bin/$_pkgname"
        install -Dm644 LICENSE-FREE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

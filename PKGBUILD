# Maintainer: Adam S Levy <adam@aslevy.com>
pkgname=diagslave-bin
_pkgname=diagslave
pkgver=2.12
pkgrel=1
pkgdesc="A command line based Modbus master simulator and test utility."
arch=("x86_64")
url="https://www.modbusdriver.com/$_pkgname.html"
license=('custom')
provides=("$_pkgname")
source=("https://www.modbusdriver.com/downloads/$_pkgname.$pkgver.zip")
sha256sums=('5db0d69676e96b4f49fd37716639fd6506ed3779108fcc3a86d4225f70e82b95')

package() {
        cd "$srcdir"
        install -Dm755 linux/$_pkgname "$pkgdir/usr/bin/$_pkgname"
        install -Dm644 LICENSE-FREE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

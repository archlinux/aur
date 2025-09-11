# Maintainer: sicalxy <sicalxy at outlook dot com>
# Previous Maintainer: Adam S Levy <adam@aslevy.com>

pkgname=diagslave-bin
_pkgname=diagslave
pkgver=3.5
pkgrel=1
pkgdesc="A command line based Modbus master simulator and test utility."
arch=("x86_64")
url="https://www.modbusdriver.com/$_pkgname.html"
license=('custom')
provides=("$_pkgname")
source=("${_pkgname}-${pkgver}.tgz::https://www.modbusdriver.com/downloads/$_pkgname.tgz")
b2sums=('b17e1abff97db0144f13f6959f65dbed75bc4537d71693db7032686814b7c070b5b8e794c145eece44803689a4da094ad1dda9dea4fc11993ff944c23ea4cd1d')

package() {
        cd "$srcdir/$_pkgname"
        install -Dm755 x86_64-linux-gnu/$_pkgname "$pkgdir/usr/bin/$_pkgname"
        install -Dm644 LICENSE-FREE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

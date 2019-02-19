# Maintainer: Adam S Levy <adam@aslevy.com>
pkgname=diagslave-bin
_pkgname=diagslave
pkgver=3.1
pkgrel=1
pkgdesc="A command line based Modbus master simulator and test utility."
arch=("x86_64")
url="https://www.modbusdriver.com/$_pkgname.html"
license=('custom')
provides=("$_pkgname")
source=("https://www.modbusdriver.com/downloads/$_pkgname.tgz")
sha256sums=('5448bf4d70a5598a2e283a44aab44ba2fb30d94103cda8205c637eef0c202cb0')

package() {
        cd "$srcdir/$_pkgname"
        install -Dm755 linux_x86-64/$_pkgname "$pkgdir/usr/bin/$_pkgname"
        install -Dm644 LICENSE-FREE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

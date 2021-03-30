# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=saw-script

pkgver=0.7
pkgrel=1
pkgdesc="The SAW scripting language."
url="http://saw.galois.com/"
arch=('x86_64')
license=('noncommercial')
depends=('ncurses5-compat-libs')
makedepends=()
optdepends=()
conflicts=()
replaces=()
backup=()
conflicts=()
provides=('saw-script')
sha512sums=('5c90607a3953c4453e1d3d992dc8d4b83f7d89713fab9338779fedc614aed2449fd8f941783e8c67c17b229e9c11648d0b2310248bdd4355aa4b1dbdd7a113b5')

source=('https://github.com/GaloisInc/saw-script/releases/download/v0.7/saw-0.7-Linux-x86_64.tar.gz')

package() {
    cd "$srcdir/saw-0.7-Linux-x86_64"
    mkdir -p "$pkgdir/usr/bin"
    cp bin/* "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
